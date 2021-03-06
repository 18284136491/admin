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

// 为方便系统核心升级，二次开发中需要用到的公共函数请写在这个文件，不要去修改common.php文件


/**
 * sort_pid 类型分类
 * Author: dear
 * @param $data
 * @param string $pid
 */
function sort_pid($data,$pid = '0'){
    $result = []; //每次都声明一个新数组用来放子元素
    foreach($data as $val){
        if($val['pid'] == $pid){ //匹配子记录
            $val['child'] = sort_pid($data,$val['id']); //递归获取子记录
            if($val['child'] == null){
                unset($val['child']); //如果子元素为空则unset()进行删除，说明已经到该分支的最后一个元素了（可选）
            }
            $result[] = $val; //将记录存入新数组
        }
    }
    return $result;
}

/**
 * setLogs [交易详情日志文件]
 * @author dear
 * @param $data
 * @return void
 */
function setLogs($data){
    file_put_contents('money_details.txt', $data,FILE_APPEND);
}






