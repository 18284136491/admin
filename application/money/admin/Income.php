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
class Income extends Admin
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

        $map['m_d.money'] = ['>=', '0'];
        $field = "m_d.id,sum(m_d.money)money,b.name";
        $data_list = Db::name('money_details')
            ->alias('m_d')
            ->field($field)
            ->join('balance b','b.id = m_d.balanceid')
            ->group('balanceid')
            ->where($map)
            ->paginate();
        // 分页数据
        $page = $data_list->render();
        // 图表按钮
        $echarts = [
            'title' => '切换图表',
            'id'  => 'echarts',
            'action'  => url('echarts'),
        ];

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('收入项明细') // 设置页面标题
            ->setTableName('money_details') // 设置数据表名
            ->setSearch(['b.name' => '收款方式']) // 设置搜索参数
            ->addColumns([ // 批量添加列
                ['name', '收款方式'],
                ['money', '交易金额'],
            ])
            ->addTopButton('echarts',$echarts)
            ->js('laydate/laydate')
            ->js('echarts')
            ->js('income')
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
            $data['create_time'] = time();

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

            // 判断交易项是收入还是支出
            if(substr($data['money'],0,1) == '+'){
                $data['money'] = substr($data['money'],1);
            }elseif(substr($data['money'],0,1) == '-'){
                $data['money'] = $data['money'];
            }else{
                $data['money'] = '-'.$data['money'];
            }
            $update = Db::name('money_details')->update($data);
            if ($update) {
                // 记录行为
                $this->success('编辑成功', cookie('__forward__'));
            } else {
                $this->error('编辑失败');
            }
        }

        $field = "m_d.*,from_unixtime(m_d.create_time,'%Y-%m-%d')create_time,t.typename,b.id balanceid";
        // 获取数据
        $info = DB::name('money_details')
            ->alias('m_d')
            ->field($field)
            ->join('type t','t.id = m_d.typeid')
            ->join('balance b','b.id = m_d.balanceid')
            ->where("m_d.id = $id")
            ->find();
        // 获取交易类型
        $url = url('getTypeList');
        $getTypeBtn = '<button id="getTypeList" attr_typeid="'.$info['typeid'].'"  attr_typepid="'.$info['type_pid'].'" type="button" action="'."$url".'" class="btn btn-default">获取类型列表</button>';
        // 获取支付类型
        $balance_url = url('getBalanceList');
        $getBalanceBtn = '<button id="getBalanceBtn" attr-balanceid="'.$info['balanceid'].'" type="button" action="'."$balance_url".'" class="btn btn-default">获取支付类型</button>';
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
            ->js('edit')
            ->setFormData($info) // 设置表单数据
            ->fetch();
    }

    /**
     * 授权
     * @param string $tab tab分组名
     * @param int $uid 用户id
     * @author 蔡伟明 <314013107@qq.com>
     * @return mixed
     */
    public function access($tab = '', $uid = 0)
    {
        if ($uid === 0) $this->error('缺少参数');

        // 保存数据
        if ($this->request->isPost()) {
            $post = $this->request->post();
            list($module, $group) = explode('_', $post['tab_name']);

            // 先删除原有授权
            $map['module'] = $module;
            $map['group']  = $group;
            $map['uid']    = $post['uid'];
            if (false === AccessModel::where($map)->delete()) {
                $this->error('清除旧授权失败');
            }

            $data = [];
            // 授权节点
            $nids = [];
            if (isset($post['group_auth'])) {
                $nids = $post['group_auth'];
                foreach ($post['group_auth'] as $nid) {
                    $data[] = [
                        'nid'    => $nid,
                        'uid'    => $post['uid'],
                        'group'  => $group,
                        'module' => $module
                    ];
                }
                // 添加新的授权
                $AccessModel = new AccessModel;
                if (!$AccessModel->saveAll($data)) {
                    $this->error('操作失败');
                }
            }

            // 记录行为
            $nids = !empty($nids) ? implode(',', $nids) : '无';
            $details = "模块($module)，分组($group)，授权节点ID($nids)";
            action_log('user_access', 'admin_user', $uid, UID, $details);
            $this->success('操作成功', 'index');
        }

        // 获取所有授权配置信息
        $list_access = ModuleModel::where('access', 'neq', '')->column('access', 'name');
        if ($list_access) {
            $curr_access  = '';
            $group_table  = '';
            $tab_list     = [];
            foreach ($list_access as $module => &$groups) {
                $groups = json_decode($groups, true);

                foreach ($groups as $group => $access) {
                    // 如果分组为空，则默认为第一个
                    if ($tab == '') {
                        // 当前分组名
                        $tab = $module. '_' . $group;
                        // 节点表名
                        $group_table = $access['table_name'];
                        // 当前权限配置信息
                        $curr_access = $access;
                    }

                    // 配置分组信息
                    $tab_list[$module. '_' . $group] = [
                        'title' => $access['tab_title'],
                        'url'   => url('access', [
                            'tab' => $module. '_' . $group,
                            'uid' => $uid
                        ])
                    ];
                }
            }

            list($module, $group) = explode('_', $tab);
            if ($curr_access == '') {
                $curr_access = $list_access[$module][$group];
                $group_table = $curr_access['table_name'];
            }

            // tab分组信息
            $tab_nav = [
                'tab_list' => $tab_list,
                'curr_tab' => $tab
            ];
            $this->assign('tab_nav', $tab_nav);

            // 获取授权数据
            $groups = '';
            if (isset($curr_access['model_name']) && $curr_access['model_name'] != '') {
                $class = "app\\{$module}\\model\\".$curr_access['model_name'];
                $model = new $class;

                try{
                    $groups = $model->access();
                }catch(\Exception $e){
                    $this->error('模型：'.$class."缺少“access”方法");
                }
            } else {
                // 没有设置模型名，则按表名获取数据
                $fileds = [
                    $curr_access['primary_key'],
                    $curr_access['parent_id'],
                    $curr_access['node_name']
                ];

                $groups = Db::name($group_table)->order($curr_access['primary_key'])->field($fileds)->select();
            }

            if ($groups) {
                // 查询当前用户的权限
                $map['module'] = $module;
                $map['group']  = $group;
                $map['uid']    = $uid;
                $node_access = AccessModel::where($map)->column('nid');
                $this->assign('node_access', $node_access);
                $this->assign('tab_name', $tab);
                $this->assign('field_access', $curr_access);
                $tree_config = [
                    'title' => $curr_access['node_name'],
                    'id'    => $curr_access['primary_key'],
                    'pid'   => $curr_access['parent_id']
                ];
                $this->assign('groups', Tree::config($tree_config)->toList($groups));
            }
        }

        $page_tips = isset($curr_access['page_tips']) ? $curr_access['page_tips'] : '';
        $tips_type = isset($curr_access['tips_type']) ? $curr_access['tips_type'] : 'info';
        $this->assign('page_tips', $page_tips);
        $this->assign('tips_type', $tips_type);
        $this->assign('page_title', '数据授权');
        return $this->fetch();
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
     * echarts 消费数据
     * Author: dear
     */
    public function echarts()
    {
        /***************资金流水类型统计***************/
        $start = $this->request->param('start');
        $end = $this->request->param('end');
        $map['m_d.money'] = ['>=', 0];
        if($start && $end){
            $map["from_unixtime(m_d.create_time,'%Y-%m-%d')"] = ['between',[$start,$end]];
        }elseif($start){
            $map["from_unixtime(m_d.create_time,'%Y-%m-%d')"] = ['>=',$start];
        }elseif($end){
            $map["from_unixtime(m_d.create_time,'%Y-%m-%d')"] = ['<=',$end];
        }
        // 获取收款方式数据
        $field = "b.id,sum(m_d.money)value,b.name";
        $d_data = Db::name('money_details')
            ->alias('m_d')
            ->field($field)
            ->join('balance b','b.id = m_d.balanceid')
            ->group('balanceid')
            ->where($map)
            ->select();
        foreach($d_data as $key => $val){
            $x_data[] = Db::name('money_details')
                ->alias('m_d')
                ->field('sum(m_d.money) value,t.typename name')
                ->join('type t', 't.id = m_d.typeid','left')
                ->where('m_d.balanceid',$val['id'])
                ->where($map)
                ->group('m_d.typeid')
                ->order('m_d.balanceid')
                ->select();
            $d_data[$key] = array_splice($val,1,3);
        }
        // 三维数组改二维数组
        foreach($x_data as $key1 => $val1){
            foreach($val1 as $key2 => $val2){
                $x_datas[] = $val1[$key2];
            }
        }
        // 删除金额为空的数据
        $total = array_merge($d_data,$x_datas);
        $total_money = array_sum(array_column($x_datas,'value'));// 消费总金额

        // 银证转账金额
        $map['m_d.typeid'] = ['eq', '109'];
        $stock_money = Db::name('money_details')->alias('m_d')->field('sum(money)money')->where($map)->find();

        $res = [
            'total' => $total,
            'd_data' => $d_data,
            'x_data' => $x_datas,
            'total_money' => $total_money,
            'stock' => $stock_money['money'],
            'reality' => $total_money - $stock_money['money'],
        ];
        return $res;
    }

    /**
     * getTypeList 获取交易类型
     * Author: dear
     */
    public function getTypeList(){
        // 返回交易类型数据
        $type_data = Db::name('type')->select();
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
        // 验证余额是否足够支付
        $info = DB::name('balance')->where($balance_map)->find();
        if($info['balance'] < $data['money']){
            $this->error('余额不足');
        }
        $balance_res = DB::name('balance')->where($balance_map)->setDec('balance',$data['money']);

        // 判断交易项是收入还是支出
        if(substr($data['money'],0,1) == '+'){
            $data['money'] = substr($data['money'],1);
        }elseif(substr($data['money'],0,1) == '-'){
            $data['money'] = $data['money'];
        }else{
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
            'type_pid' => $data['typepid'],
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
            'type_pid' => $data['typepid'],
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
