<?php

namespace app\common\model;

use think\Model;

class Students extends Model
{
    protected $pk = 'account'; // 设置主键名称
    protected $table = 'students'; // 设置当前模型对应的完整数据表名称
}
