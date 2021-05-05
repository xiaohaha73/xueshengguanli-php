<?php

namespace app\common\model;

use think\Model;

class Homeworks extends Model
{
    // 开启自动时间戳
    protected $autoWriteTimestamp = true;
    protected $table = 'homework';
}
