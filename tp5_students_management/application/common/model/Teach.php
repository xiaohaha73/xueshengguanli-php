<?php

namespace app\common\model;

use think\model\Pivot;

// 要建立多对多关系
class Teach extends Pivot
{
    protected $pk = 'id'; // 设置主键名称
    protected $table = 'teach'; // 设置当前模型对应的完整数据表名称
}
