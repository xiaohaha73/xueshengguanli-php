<?php

namespace app\admin\controller;

use app\admin\model\Admins;
use app\login\validate\logValidate;
use think\Controller;
use think\facade\Session;
use think\Request;


class Admin extends Controller
{
    // 管理员登陆接口
    public function login(Request $request) {
        if(!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();

        // 判断是否是管理员身份
        if ($data['role'] != '3') {
            return resData(0, '非管理员禁止登陆');
        }

        $validate  = new logValidate();
        if (!$validate->check($data)) {
            // 验证不通过
            return resData(0, $validate->getError());
        }

        $account = $data['account'];
        $password = md5($data['password']);

        // 调用数据库进行检查

        $admin = Admins::where('account', $account)->find();

        // 没查询到就是不存在这个用户
        if (!$admin) {
            return resData(0, '不存在该账号！');
        }

        // 查询到用户然后检查密码
        if ($password != $admin['password']) {
            // 密码错误
            return resData(0, '密码错误！');
        }

        // 生成登陆成功session值用于是否处于登陆状态判断
        Session::set('adminId', $data['account']);

        return resData(1,'登陆成功',['role'=>'admin','account'=>$account]);

    }

    // 验证管理员是否登录的接口
    public function checkLogin()
    {
        $account = Session::get('adminId');
        // 存在session就说明是登陆状态
        if (!$account) {
            return resData(0, '未登录');
        }

        // 判断是学生还是老师，然后返回不同的值
        return resData(1,'管理员',['role'=>'admin','account'=>$account]);
    }


    // 退出登陆接口
    public function logout() {
        Session::clear();
        return resData(1,'退出登陆成功');
    }


    // 获取管理员身份信息
    public function getAdmin($id) {
        $data = Admins::where('account',$id)->field('password',true)->find();

        if (!$data) {
            return resData(0,'网络异常');
        }
        // 获取成功
        return resData(1,'获取成功',$data);
    }


}
