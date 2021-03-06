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

/**
 * 用户默认控制器
 * @package app\user\admin
 */
class Type extends Admin
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
        $data_list = DB::name('type')->where($map)->order('sort asc')->paginate();

        // 分页数据
        $page = $data_list->render();
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('交易类型列表') // 设置页面标题
            ->setTableName('money_details') // 设置数据表名
            ->setSearch(['typename' => '交易名称']) // 设置搜索参数
            ->addColumns([ // 批量添加列
                ['sort', '排序'],
                ['typename', '交易名称'],
//                ['pid', '父级Id'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('add') // 批量添加顶部按钮
            ->addRightButtons('edit,delete') // 添加授权按钮
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

            if($data['pid'] == ''){
                $this->error('请选择交易父类型');
            }
            $insert = Db::name('type')->insert($data);
            if ($insert) {
                // 记录行为
                $this->success('新增成功', url('index'));
            } else {
                $this->error('新增失败');
            }
        }

        // 获取地址
        $url = url('getTypeList');
        $getTypeBtn = '<button id="getTypeList" type="button" action="'."$url".'" class="btn btn-default">获取类型列表</button>';

        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('新增交易记录') // 设置页面标题
            ->addBtn($getTypeBtn)
            ->addFormItems([ // 批量添加表单项
                ['text', 'typename', '类型名称'],
                ['text', 'sort', '排序'],
            ])
            ->js('typeadd')
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

            $up = Db::name('type')->update($data);
            if ($up) {
                $this->success('编辑成功', cookie('__forward__'));
            } else {
                $this->error('编辑失败');
            }
        }

        // 获取数据
        $info = Db::name('type')->where('id', $id)->find();
        // 获取地址
        $url = url('getTypeList');
        $getTypeBtn = '<button id="getTypeList" attr-typepid="'.$info['pid'].'" type="button" action="'."$url".'" class="btn btn-default">获取类型列表</button>';
        // 使用ZBuilder快速创建表单
        return ZBuilder::make('form')
            ->setPageTitle('编辑') // 设置页面标题
            ->addFormItems([ // 批量添加表单项
                ['hidden', 'id'],
                ['text', 'typename', '类型名称'],
                ['text', 'sort', '排序'],
            ])
            ->addBtn($getTypeBtn)
            ->js('typeedit')
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
        $map['id'] = ['in',$ids];
        if($type == 'enable'){
            $data['status'] = 1;
        }elseif($type == 'disable'){
            $data['status'] = 0;
        }elseif($type == 'delete'){
            Db::name('type')->where($map)->delete();
            $this->success('操作成功',url('index'));
        }
        Db::name('type')->where($map)->update($data);
        $this->success('操作成功',url('index'));
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
     * getTypeList 获取类型列表
     * Author: dear
     */
    public function getTypeList(){
        // 返回交易类型数据
        $map['pid'] = 0;
        $type_data = Db::name('type')->where($map)->group('sort asc')->select();
        return $type_data;
    }
}
