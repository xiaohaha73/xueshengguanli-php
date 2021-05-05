<?php

namespace app\admin\controller;

use app\common\model\Homeworks;
use think\Controller;
use think\Request;
use think\Validate;

class Homework extends Controller
{
    // 课后作业的控制器
    // 根据班级id和课程id获取作业数据
    public function getHomework(Request $request,$classid,$courseid) {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $homework = new Homeworks();
        $ret = $homework::where('class_id',$classid)
            ->where('course_id',$courseid)
            ->select();

        if (!$ret) {
            return resData(1,'获取成功',[]);
        }

        return resData(1,'获取成功',$ret);
    }

    //添加作业接口
    public function addHomework(Request $request) {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $res = $request->post();
        // 使用验证器验证
        $validate = Validate::make([
            'class_id' => 'require',
            'course_id' => 'require',
            'homework'=>'require'
        ],[
            // 验证失败报错信息
            'class_id.require' => 'class_id不能为空',
            'course_id.require' => 'course_id不能为空',
            'homework.require' => 'homework不能为空'
        ]);

        if(!$validate->check($res)) {
            return resData(0,$validate->getError());
        }

        // 调用模型
        $homework = new Homeworks();
        $ret = $homework->save($res);

        if (!$ret) {
            return resData(0,'存入数据失败');
        }


        return resData(1,'存入成功');
    }

}
