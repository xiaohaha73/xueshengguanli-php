<?php

namespace app\login\controller;

use app\common\model\Students;
use app\login\validate\regValidate;
use think\captcha\Captcha;
use think\Controller;
use think\Db;
use think\Request;


// 用户注册接口
class Register extends Controller
{
    // 设置是否抛出异常
    protected $failException = true;

    // 验证码接口生成
    public function captcha()
    {
        $captcha = new Captcha();
        return $captcha->entry();
    }

    // 注册新用户
    public function reg(Request $request)
    {
        if ($request->isPost()) {
            $data = $request->post();

            // 查询该用户是否已经在数据库中
            $account = $data['account'];
            $user = Students::where('account',$account)->find();

            if ($user) {
                // 已经存在该用户
                return resData(3,'该用户已经存在');
            }

            // 调用验证器验证
            $validate = new regValidate();
            if (!$validate->check($data)) {
                // 验证不通过
                 return resData(0, $validate->getError());
            }


            // 判断两次输入的密码是否相同
            if ($data["password"] != $data["rPassword"]) {
                // 返回0
                return resData(0, '两次输入的密码不同');
            }

            // 两次输入的密码相同，加密之后上传到数据库
            $regData = [
                'account'=>$data['account'],
                'name'=>$data['name'],
                'password' =>md5($data['password']),
                'classid' =>$data['classid']
            ];

            // 在成绩表中创建这个学生
            Db::name('grade')
                ->insert(['account'=>$data['account']]);

            // 在个人信息表中创建这个用户
            Db::table('user_info')->insert(['account'=>$data['account']]);

            if(! Students::create($regData)){
                // 创建失败 0
                return resData(0,'用户创建失败！');
            }


            // 注册成功
            return resData(1,'注册成功');


        }else {
            return resData(404, '错误请求路径');
        }

    }


}
