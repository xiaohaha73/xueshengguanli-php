<?php

namespace app\login\validate;

use think\Validate;

class logValidate extends Validate
{
    /**
     * 定义验证规则
     * 格式：'字段名'	=>	['规则1','规则2'...]
     *
     * @var array
     */
	protected $rule = [
        'password' => 'require|min:5|max:20',
        'account' => 'require|max:15|min:5',
    ];

    /**
     * 定义错误信息
     * 格式：'字段名.规则名'	=>	'错误信息'
     *
     * @var array
     */
    protected $message = [
        'password.require' => '密码不能为空',
        'password.max'=>'密码长度不能超过20',
        'password.min'=>'密码长度不能小于5',
        'account.require' => '学号不能为空',
        'account.min'=>'学号长度不能小于5',
        'account.max'=>'学号长度不能超过15'
    ];
}
