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
class Balance extends Admin
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
        $field = "*,from_unixtime(create_time,'%Y-%m-%d')create_time";
        // 数据列表
        $data_list = DB::name('today_deal')->field($field)->where($map)->paginate();

        // 分页数据
        $page = $data_list->render();
        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setPageTitle('日交易统计') // 设置页面标题
            ->setTableName('today_deal') // 设置数据表名
            ->addColumns([ // 批量添加列
                ['create_time', '日期'],
                ['wx_money', '微信余额'],
                ['zfb_money', '支付宝余额'],
                ['zs_money', '招商银行余额'],
                ['ny_money', '农业银行余额'],
                ['zg_money', '中国银行余额'],
                ['cash_money', '现金余额'],
                ['pa_money', '平安证券余额'],
                ['huabei_money', '花呗余额'],
                ['expend_money', '支出总金额'],
                ['income_money', '收益总金额'],
                ['deal_count', '交易次数'],
                ['balance', '总余额'],
            ])
            ->setRowList($data_list) // 设置表格数据
            ->setPages($page) // 设置分页数据
            ->fetch(); // 渲染页面
    }
}
