<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Schedule extends Controller
{
    // 根据班级获取该班级的课程表
    public function getSchedule(Request $request,$classid=1) {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        // 查询数据库
        $ret = Db::name('schedulecard')
            ->field(['date','a','b','c','d','e'])
            ->where('classid',$classid)
            ->select();

        if (!$ret) {
            return resData(0,'网络异常');
        }

        return resData(1,'获取成功',$ret);

    }

    // 更改班级课程表
    public function editSchedule(Request $request) {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $reqData = $request->post();

        $data = [
            'a'=>$reqData['a'],
            'b'=>$reqData['b'],
            'c'=>$reqData['c'],
            'd'=>$reqData['d'],
            'e'=>$reqData['e'],
            ];

        $ret = Db::name('schedulecard')
            ->where('classid',(int)$reqData['classid'])
            ->where('row_num',(int)$reqData['row'])
            ->update($data);

        if (!$ret) {
            return resData(0,'更新失败');
        }

        return resData(1,'更新成功');

    }

}
