<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\common\model\Students;

class Student extends Controller
{
    // 获取学生信息的接口
    // 如果没给定页数和每页显示条数就用默认值
    public function getStudents(Request $request,$page=1,$size=4)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        // 使用模型获取数据
        // $data = Students::select();
        $data = Students::field('password', true)->page($page,$size)->select();
        $total = Students::count();

        $res["success"] = 1;
        $res["msg"] = '请求成功';
        $res["total"] = $total;
        $res["data"] = $data;
        return json($res);
    }


    // 根据account值查找学生
    public function getStudentById(Request $request,$account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        // 使用模型获取数据
        // $data = Students::select();
        $data = Students::where('account',$account)->field('password', true)->select();

        if(!$data) {
            return resData(0,'获取数据失败');
        }

        return resData(1,'获取成功',$data[0]);

    }


    // 删除学生
    public function deleteStudent(Request $request, $account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }


        $res = Students::where('account', $account)->delete();

        if (!$res) {
            // 删除失败
            return resData(0, '删除失败');
        }

        // 删除成功
        return resData(1, '删除成功');

    }


    // 更新学生
    public function updateStudent(Request $request)
    {

        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        // 要更新的数据
        $data = $request->post();
        $res = Students::where('account', $data['account'])->update($data);
        if (!$res) {
            // 更新失败
            return resData(0, '更新失败');
        }

        // 更新成功
        return resData(1, '更新成功');
    }

}
