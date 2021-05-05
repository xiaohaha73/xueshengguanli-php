<?php

namespace app\user\controller;

use think\Controller;
use think\Db;
use think\Request;

class User extends Controller
{
    // 获取老师或者学生的名字
    public function getName(Request $request, $role, $account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }
        $ret = [];
        if ($role == 'student') {
            $ret = Db::table('students')
                ->where('account', $account)
                ->field('name')
                ->find();
        } else {
            $ret = Db::table('teachers')
                ->where('account', $account)
                ->field('name')
                ->find();
        }

        if (count($ret) === 0) {
            return resData(0, '用户不存在!');
        }

        return resData(1, '获取成功', $ret);
    }

    // 获取用户的个人信息
    public function getUserInfo(Request $request,$account) {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $ret = Db::table('user_info')
            ->where('account',$account)
            ->find();

        if (!$ret) {
            return resData(0,'不存在该信息');
        }

        return resData(1,'获取成功',$ret);

    }

    // 获取用户性别
    public function getSex(Request $request,$role,$account) {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        if ($role == 'student') {
            $ret = Db::table('students')
                ->field('sex,name')
                ->where('account',$account)
                ->find();

            if (!$ret) {
                return resData(0,'获取失败');
            }

            return resData(1,'获取成功',$ret);
        }else {
            $ret = Db::table('teachers')
                ->field('sex,name')
                ->where('account',$account)
                ->find();

            if (!$ret) {
                return resData(0,'获取失败');
            }

            return resData(1,'获取成功',$ret);
        }
    }


    // 更改用户性别
    public function editSex (Request $request) {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();

        if ($data['role'] == 'student') {
            $ret = Db::table('students')
                ->where('account',$data['account'])
                ->update(['sex'=>(int) $data['sex']]);

            if (!$ret) {
                return resData(0,'更新失败');
            }
        }else {
            $ret = Db::table('teachers')
                ->where('account',$data['account'])
                ->update(['sex'=>(int) $data['sex']]);

            if (!$ret) {
                return resData(0,'更新失败');
            }
        }

        return resData(1,'更新成功');
    }

    // 更新用户个人信息
    public function updateUserInfo (Request $request) {

        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();

        $ret = Db::table('user_info')
            ->where('account',$data['account'])
            ->update($data);


        if ($ret) {
            return resData(0,'更新失败');
        }

        return resData(1,'更新成功');
    }
}
