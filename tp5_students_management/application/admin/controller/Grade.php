<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Grade extends Controller
{
    // 根据id获取这个班的学生成绩
    public function getGrade(Request $request, $classid = 1)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $ret = Db::table('students')
            ->alias('a')
            ->join(['grade' => 'b'], 'a.account=b.account')
            ->where('a.classid', $classid)
            ->field(['a.name', 'b.*'])
            ->select();

        if (!$ret) {
            return resData(0, '网络异常，请稍后重试');
        }
        return resData(1, '获取成功', $ret);
    }

    // 根据account值更新学生成绩
    public function editGrade(Request $request)
    {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $req = $request->post();

        $ret = Db::table('grade')
            ->where('account', $req['account'])
            ->update([
                'a' => (int)$req['a'],
                'b' => (int)$req['b'],
                'c' => (int)$req['c'],
                'd' => (int)$req['d'],
                'e' => (int)$req['e'],
                'f' => (int)$req['f'],
                'g' => (int)$req['g'],
                'h' => (int)$req['h'],
                'i' => (int)$req['i']
            ]);


        if (!$ret) {
            return resData(0, '更新失败');
        }

        return resData(1, '更新成功');
    }


    // 根据account值更新某一个科目的成绩
    public function editScore(Request $request)
    {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();

        $courseName = $data['courseid'];
        $score = (int)$data['score'];
        $req = [$courseName => $score];

        $ret = Db::table('grade')
            ->where('account', $data['account'])
            ->update($req);
        if (!$ret) {
            return resData(0,'更新失败');
        }

        return resData(1,'更新成功');
    }


    // 根据account值获取某个学生的成绩
    public function getStudentGrade(Request $request,$account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $ret = Db::table('grade')
            ->alias('a')
            ->join(['students'=>'b'],'a.account=b.account')
            ->where('a.account',$account)
            ->field(['a.*','b.name'])
            ->find();

        if(!$ret) {
            return resData(0,'获取失败');
        }

        return resData(1,'获取成功',$ret);
    }

}
