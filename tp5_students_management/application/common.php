<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

// 返回请求响应数据
/**
 * @param $status
 * @param $msg
 * @param $data
 */
function resData($status, $msg, $data = [])
{

    $res["success"] = $status;
    $res["msg"] = $msg;
    $res["data"] = $data;
    return json($res);
}











