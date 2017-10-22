<?php
// +----------------------------------------------------------------------
// | 海豚PHP框架 [ DolphinPHP ]
// +----------------------------------------------------------------------
// | 版权所有 2016~2017 河源市卓锐科技有限公司 [ http://www.zrthink.com ]
// +----------------------------------------------------------------------
// | 官方网站: http://dolphinphp.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\money\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\user\model\User as UserModel;
use app\user\model\Role as RoleModel;
use app\admin\model\Module as ModuleModel;
use app\admin\model\Access as AccessModel;
use util\Tree;
use think\Db;
use think\Hook;
use think\Response;

/**
 * 用户默认控制器
 * @package app\user\admin
 */
class Index extends Admin
{
    /**
     * 用户首页
     * @return mixed
     */
    public function index()
    {
        cookie('__forward__', $_SERVER['REQUEST_URI']);
        // 获取查询条件
        $map = $this->getMap();
        // 数据列表
        $field = "m_d.*,from_unixtime(m_d.create_time,'%Y-%m-%d %H:%i')create_time,t.typename,b.name";
        $data_list = DB::name('money_details')
            ->alias('m_d')
            ->field($field)
            ->join('type t','t.id = m_d.typeid')
            ->join('balance b','b.id = m_d.balanceid')
            ->where($map)
            ->order('m_d.create_time desc')
            ->paginate();
        // 分页数据
        $page = $data_list->render();
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('资金流水明细') // 设置页面标题
            ->setTableName('money_details') // 设置数据表名
            ->setSearch(['name' => '支付方式', 'typename' => '交易类型']) // 设置搜索参数
            ->addColumns([ // 批量添加列
                ['create_time', '交易时间'],
                ['name', '支付方式'],
                ['typename', '交易类型'],
                ['money', '交易金额'],
                ['description', '交易描述'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('add') // 批量添加顶部按钮
            ->addRightButton('edit') // 添加授权按钮
            ->setRowList($data_list) // 设置表格数据
            ->setPages($page) // 设置分页数据
            ->fetch(); // 渲染页面
    }

    /**
     * 新增
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function add()
    {
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();

            if(!$data['typeid']){
                $this->error('请选择交易类型');
            }
            $data['create_time'] = $data['create_time'] ? strtotime($data['create_time']) : time();

            // 添加数据并扣除交易金额
            if(isset($data['receiveType'])){
                $res = $this->Receive($data);
            }else{
                $res = $this->Balance($data);
            }
            if ($res) {
                $this->success('新增成功', url('index'));
            }
            $this->error('新增失败');
        }

        // 获取交易类型
        $url = url('getTypeList');
        $getTypeBtn = '<button id="getTypeList" type="button" action="'."$url".'" class="btn btn-default">交易类型</button>';

        // 获取支付类型
        $balance_url = url('getBalanceList');
        $getBalanceBtn = '<button id="getBalanceBtn" type="button" action="'."$balance_url".'" class="btn btn-default">支付方式</button>';

        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('新增交易记录') // 设置页面标题
            ->addFormItems([ // 批量添加表单项
                ['text', 'money', '交易金额'],
                ['textarea', 'description', '交易描述'],
            ])
            ->addBtn($getTypeBtn)
            ->addBtn($getBalanceBtn)
            ->js('laydate/laydate')
            ->js('add')
            ->fetch();
    }

    /**
     * 编辑
     * @param null $id 用户id
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function edit($id = null)
    {
        if ($id === null) $this->error('缺少参数');
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['create_time'] = $data['create_time'] ? strtotime($data['create_time']) : time();

            // 获取原付款方式
            $map['id'] = $data['id'];
            $info = Db::name('money_details')->where($map)->find();
            // 判断支付方式是否改变
            if($info['balanceid'] != $data['balanceid']){
                $money = substr($info['money'],1);// 原支付金额
                $inc_map['id'] = $info['id'];// 原付款方式

                Db::startTrans();
                // 原付款方式金额还原
                $inc_res = Db::name('balance')->where('id',$info['balanceid'])->setInc('balance',$money);
                // 现支付方式扣款
                $dec_res = Db::name('balance')->where('id',$data['balanceid'])->setDec('balance',$money);

                if($inc_res && $dec_res){
                    Db::commit();
                }
                Db::rollback();
            }

            // 判断金额是否修改
            if($info['money'] != $data['money']){

                $money = $info['money'];// 原交易金额
                // 原金额与修改金额差额
                $up_money = $data['money'] > $money ? $data['money'] - $money : '-'.($money - $data['money']);

                Db::startTrans();
                // 如果差额为负数
                if(substr($up_money,0,1) == '-'){
                    $up_money = substr($up_money,1);// 原支付金额
                    // 支付方式扣除差额
                    $up_res = Db::name('balance')->where('id',$data['balanceid'])->setDec('balance',$up_money);
                }else{
                    // 支付方式扣除差额
                    $up_res = Db::name('balance')->where('id',$data['balanceid'])->setinc('balance',$up_money);
                }
                if($up_res){
                    Db::commit();
                }
                Db::rollback();
            }
            // 判断交易项是收入还是支出
            if(substr($data['money'],0,1) == '+'){
                $data['money'] = substr($data['money'],1);
            }elseif(substr($data['money'],0,1) == '-'){
                $data['money'] = $data['money'];
            }else{
                $data['money'] = '-'.$data['money'];
            }

            // 交易详情
            $update = Db::name('money_details')->update($data);
            if ($update) {
                // 记录行为
                $this->success('编辑成功', cookie('__forward__'));
            } else {
                $this->error('编辑失败');
            }
        }

        $field = "m_d.*,from_unixtime(m_d.create_time,'%Y-%m-%d %H:%i:%s')create_time,t.typename,b.id balanceid";
        // 获取数据
        $info = DB::name('money_details')
            ->alias('m_d')
            ->field($field)
            ->join('type t','t.id = m_d.typeid')
            ->join('balance b','b.id = m_d.balanceid')
            ->where("m_d.id = $id")
            ->find();

        $type = substr($info['money'],0,1) == '-' ? 0 : 1;// 判断当前交易是收款还是付款
        // 获取交易类型
        $url = url('getTypeList');
        $getTypeBtn = '<button id="getTypeList" attr_typeid="'.$info['typeid'].'"  attr_typepid="'.$info['type_pid'].'" type="button" action="'."$url".'" class="btn btn-default">获取类型列表</button>';
        // 获取支付类型
        $balance_url = url('getBalanceList');
        $getBalanceBtn = '<button id="getBalanceBtn" attr-time="'.$info['create_time'].'" attr-type="'.$type.'" attr-balanceid="'.$info['balanceid'].'" type="button" action="'."$balance_url".'" class="btn btn-default">获取支付类型</button>';
        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('编辑') // 设置页面标题
            ->addFormItems([ // 批量添加表单项
                ['hidden', 'id'],
                ['text', 'money', '交易金额'],
                ['textarea', 'description', '交易描述'],
            ])
            ->addBtn($getTypeBtn)
            ->addBtn($getBalanceBtn)
            ->js('laydate/laydate')
            ->js('edit')
            ->setFormData($info) // 设置表单数据
            ->fetch();
    }

    /**
     * 删除用户
     * @param array $ids 用户id
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function delete($ids = [])
    {
        Hook::listen('user_delete', $ids);
        return $this->setStatus('delete');
    }

    /**
     * 启用用户
     * @param array $ids 用户id
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function enable($ids = [])
    {
        Hook::listen('user_enable', $ids);
        return $this->setStatus('enable');
    }

    /**
     * 禁用用户
     * @param array $ids 用户id
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function disable($ids = [])
    {
        Hook::listen('user_disable', $ids);
        return $this->setStatus('disable');
    }

    /**
     * 设置用户状态：删除、禁用、启用
     * @param string $type 类型：delete/enable/disable
     * @param array $record
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function setStatus($type = '', $record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        if ((is_array($ids) && in_array(UID, $ids)) || $ids == UID) {
            $this->error('禁止操作当前账号');
        }
        $uid_delete = is_array($ids) ? '' : $ids;
        $ids        = array_map('get_nickname', (array)$ids);
        return parent::setStatus($type, ['user_'.$type, 'admin_user', $uid_delete, UID, implode('、', $ids)]);
    }

    /**
     * 快速编辑
     * @param array $record 行为日志
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function quickEdit($record = [])
    {
        $id      = input('post.pk', '');
        $id      == UID && $this->error('禁止操作当前账号');
        $field   = input('post.name', '');
        $value   = input('post.value', '');
        $config  = UserModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $config . ')，新值：(' . $value . ')';
        return parent::quickEdit(['user_edit', 'admin_user', $id, UID, $details]);
    }

    /**
     * getTypeList 获取交易类型
     * Author: dear
     */
    public function getTypeList(){
        // 返回交易类型数据
        $type_data = Db::name('type')->group('sort asc')->select();
        $data = sort_pid($type_data);
        return $data;
    }

    /**
     * getBalanceList 获取余额类型
     * Author: dear
     */
    public function getBalanceList($map = ''){
        // 返回交易类型数据
        $type_data = Db::name('balance')->where($map)->select();
//        $data = sort_pid($type_data);
        return $type_data;
    }

    /**
     * Balance [新增交易扣款]
     * @author dear
     * @param $data
     * @return void
     */
    private function Balance($data)
    {
        Db::startTrans();

        // 余额种类表扣除余额
        $balance_map['id'] = $data['balanceid'];
        // 判断交易项是收入还是支出
        if(substr($data['money'],0,1) == '+'){
            $data['money'] = substr($data['money'],1);
            // 余额表增加金额
            $balance_res = DB::name('balance')->where($balance_map)->setInc('balance',$data['money']);
        }elseif(substr($data['money'],0,1) == '-'){
            $data['money'] = $data['money'];
            // 验证余额是否足够支付
            $info = DB::name('balance')->where($balance_map)->find();
            if($info['balance'] < $data['money']){
                $this->error('余额不足');
            }
        }else{
            // 余额表扣除金额
            $balance_res = DB::name('balance')->where($balance_map)->setDec('balance',$data['money']);
            // 详情表数据
            $data['money'] = '-'.$data['money'];
        }
        // 资金流水详情表添加记录
        $insert = Db::name('money_details')->insert($data);

        if($balance_res && $insert){
            Db::commit();
            return 1;
        }
        Db::rollback();
        return 0;
    }

    /**
     * receive [转账扣款和收款]
     * @author dear
     * @param $data
     * @return void
     */
    private function Receive($data)
    {
        Db::startTrans();
        $balance_map['id'] = $data['balanceid'];
        $receive_money = $data['money'];// 转账金额
        $cover_charge = $data['cover_charge'] ? $data['cover_charge'] : 0;// 转账手续费

        // 验证余额是否足够支付
        $info = DB::name('balance')->where($balance_map)->find();
        if($info['balance'] < $receive_money){
            $this->error('余额不足');
        }
        // 余额种类表扣除余额
        $balance_res = DB::name('balance')->where($balance_map)->setDec('balance',$receive_money);

        // 收款方式增加转账金额
        $receive_map['id'] = $data['receiveType'];
        $reality_money = $receive_money - $cover_charge;// 实际收款金额
        // 收款金额为转账金额减去转账手续费
        $receive_res = DB::name('balance')->where($receive_map)->setInc('balance',$reality_money);

        // 支付类型名
        $balance_map['id'] = $data['balanceid'];
        $balance_data = $this->getBalanceList($balance_map);
        $balance_name = $balance_data[0]['name'];
        // 收款类型名
        $receive_map['id'] = $data['receiveType'];
        $receive_data = $this->getBalanceList($receive_map);
        $receive_name = $receive_data[0]['name'];

        $inc_description = "[收款]{$receive_name}收到{$balance_name}的转账,收款金额为:{$reality_money}元,手续费为:{$cover_charge}元";
        $inc_data = [
            'money' => $receive_money,
            'description' => $inc_description,
            'typeid' => $data['typeid'],
            'type_pid' => $data['type_pid'],
            'balanceid' => $data['receiveType'],
            'create_time' => time(),
        ];
        // 交易详情添加收款记录
        $inc_res = Db::name('money_details')->insert($inc_data);

        // 判断交易项是收入还是支出
        if(substr($receive_money,0,1) == '+'){
            $receive_money = substr($receive_money,1);
        }elseif(substr($receive_money,0,1) == '-'){
            $receive_money = $receive_money;
        }else{
            $receive_money = '-'.$receive_money;
        }

        $dec_description = "[转账]{$balance_name}向{$receive_name}发起转账,转账金额为:{$receive_money}元,手续费为:{$cover_charge}元";
        // 交易详情转账扣款记录
        $dec_data = [
            'money' => $receive_money,
            'description' => $dec_description,
            'typeid' => $data['typeid'],
            'type_pid' => $data['type_pid'],
            'balanceid' => $data['balanceid'],
            'create_time' => time(),
        ];
        // 交易详情添加扣款记录
        $dec_res = Db::name('money_details')->insert($dec_data);

        if($balance_res && $receive_res && $inc_res && $dec_res){
            Db::commit();
            return 1;
        }
        Db::rollback();
        return 0;
    }
}
