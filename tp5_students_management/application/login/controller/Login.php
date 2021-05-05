<?php

namespace app\login\controller;

use app\common\model\Students;
use app\common\model\Teachers;
use app\login\validate\logValidate;
use think\Controller;
use think\facade\Session;
use think\Request;


// 用户登陆接口
class Login extends Controller
{

    // 设置是否抛出异常
    protected $failException = true;


    // 测试接口
    public function hello()
    {
        // 1618838137
        return "当前时间：" . time();
    }


    // 验证用户登陆
    public function login(Request $request)
    {
        // 判断是否是post请求
        if (!$request->isPost()) {
            // 返回404
            return resData(404, '错误请求路径');
        }

        // 调用验证器检查数据是否符合规范
        $data = $request->post();
        $validate = new logValidate();
        if (!$validate->check($data)) {
            // 验证不通过
            return resData(0, $validate->getError());
        }

        $account = $data['account'];
        $password = md5($data['password']);
        $role = isset($data['role']) ? (int)$data['role'] : 1;


        // 调用数据库进行检查
        if ($role == 1) {
            $user = Students::where('account', $account)->find();
        } else {
            $user = Teachers::where('account', $account)->find();
        }


        // 没查询到就是不存在这个用户
        if (!$user) {
            return resData(0, '未注册用户！');
        }

        // 查询到用户然后检查密码
        if ($password != $user['password']) {
            // 密码错误
            return resData(0, '密码错误！');
        }


        // 生成登陆成功session值用于是否处于登陆状态判断
        Session::set('uid', $data['account']);
        Session::set('urole',$role); // 用于判断是老师还是学生
        // dump($user);
        // return resData(1, '登陆成功');
        return $role? resData(1,'登陆成功',['role'=>'student','account'=>$account])
            :
            resData(1,'登陆成功',['role'=>'teacher','account'=>$account]);
    }


    // 检查登陆状态
    public function checkLogin()
    {
        $account = Session::get('uid');
        // 存在session就说明是登陆状态
        if (!$account) {
            return resData(0, '未登录');
        }

        // 判断是学生还是老师，然后返回不同的值
        return Session::get('urole')? resData(1,'学生用户',['role'=>'student','account'=>$account])
            :
            resData(1,'教师用户',['role'=>'teacher','account'=>$account]);
    }


    // 退出登陆接口
    public function logout() {
        // dump($account);
        // 清除这个session
        Session::clear();
//        Cookie::set('PHPSESSID',null);
        return resData(1,'退出登陆成功');
    }

}
