<?php

namespace app\admin\model;

use think\Model;

class Admins extends Model
{
    protected $pk = 'account'; // 设置主键名称
    protected $table = 'admin'; // 设置当前模型对应的完整数据表名称
}
