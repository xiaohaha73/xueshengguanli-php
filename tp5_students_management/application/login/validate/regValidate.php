<?php

namespace app\login\validate;

use think\Validate;

// 登陆验证规则

class regValidate extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'    =>    ['规则1','规则2'...]
     *
     * @var array
     */
    protected $rule = [
        'password' => 'require|min:5|max:20',
        'rPassword' => 'require|min:5|max:20',
        'account' => 'require|max:15|min:5',
        'name' => 'require|max:4|min:2',
        'captcha' => 'require',
        'classid' => 'require'
    ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名'    =>    '错误信息'
     *
     * @var array
     */
    protected $message = [
        'name.require' => '名字不能为空',
        'name.min' => '名字不能低于2个字',
        'name.max' => '名字不能超过4个字',
        'password.require' => '密码不能为空',
        'rPassword.require' => '请再次输入密码',
        'password.max' => '密码长度不能超过20',
        'rPassword.max' => '密码长度不能超过20',
        'password.min' => '密码长度不能小于5',
        'rPassword.min' => '密码长度不能小于5',
        'account.require' => '学号不能为空',
        'account.min' => '学号长度不能小于5',
        'account.max' => '学号长度不能超过15',
        'captcha.require' => '验证码不能为空',
        'classid.require' => '班级不能为空'
    ];
}
