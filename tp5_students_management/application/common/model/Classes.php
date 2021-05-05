<?php

namespace app\common\model;

use think\Model;

class Classes extends Model
{
    protected $pk = 'id'; // 设置主键名称
    protected $table = 'class'; // 设置当前模型对应的完整数据表名称
}
