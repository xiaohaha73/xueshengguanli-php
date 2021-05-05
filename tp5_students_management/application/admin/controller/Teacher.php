<?php

namespace app\admin\controller;

use app\admin\validate\TeacherValidate;
use app\common\model\Teach;
use app\common\model\Teachers;
use think\Controller;
use think\Db;
use think\Request;
use think\Validate;


class Teacher extends Controller
{
    // 获取老师列表
    public function getTeachers(Request $request, $page = 1, $size = 4)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }


        $data = Teachers::field('password', true)->page($page, $size)->select();
        $total = Teachers::count();

        $res["success"] = 1;
        $res["msg"] = '请求成功';
        $res["total"] = $total;
        $res["data"] = $data;
        return json($res);
    }


    // 根据account值查询老师的接口
    public function getTeacherById(Request $request, $account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $data = Teachers::where('account', $account)->find();
        if (!$data) {
            return resData(0, '教师不存在');
        }
        return resData(1, '查找成功', $data);
    }


    // 根据name值查询老师
    public function getTeacherByName(Request $request, $name)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $data = Teachers::field('password', true)->where('name', $name)->find();
        if (!$data) {
            return resData(0, '教师不存在');
        }
        return resData(1, '查找成功', $data);
    }


    // 添加老师
    public function addTeacher(Request $request)
    {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();
        // 判断两次密码是否相同
        if ($data['password'] != $data['rPassword']) {
            return resData(0, '添加失败!');
        }

        // 密码相同调用验证器进行验证
        $validate = new TeacherValidate();
        $isRight = $validate->check($data);

        if (!$isRight) {
            return resData(0, $validate->getError());
        }

        // 调用数据库查询是否存在这个老师
        $res = Teachers::where('account', $data['account'])->find();
        if ($res) {
            return resData(3, '该账号已经存在！');
        }

        // 验证成功调用数据库
        $regData = [
            'account' => $data['account'],
            'name' => $data['name'],
            'password' => md5($data['password']),
            'courseid' => $data['courseid']
        ];

        // 在个人信息表中创建这个用户
        Db::table('user_info')->insert(['account'=>$data['account']]);

        if (!Teachers::create($regData)) {
            // 创建失败
            return resData(0, '创建失败');
        }

        // 创建成功
        return resData(1, '创建成功');

    }


    // 编辑老师的接口
    public function updateTeacher(Request $request)
    {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();
        $validate = Validate::make([
            'account' => 'require|max:15|min:5',
            'name' => 'require|max:4|min:2',
            'courseid' => 'require'
        ], [
            'name.require' => '名字不能为空',
            'name.min' => '名字不能低于2个字',
            'name.max' => '名字不能超过4个字',
            'account.require' => '账号不能为空',
            'account.min' => '账号长度不能小于5',
            'account.max' => '账号长度不能超过15',
            'courseid.require' => '课程不能为空'
        ]);
        if (!$validate->check($data)) {
            return resData(0, $validate->getError());
        }

        // 验证成功更新数据
        $ret = Teachers::where('account', $data['account'])->update($data);
        if (!$ret) {
            return resData(0, '网络异常');
        }

        return resData(1, '更新成功');

    }


    // 删除老师的接口
    public function deleteTeacher(Request $request, $account)
    {

        // dump($account);
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $ret = Teachers::where('account', $account)->delete();

        if (!$ret) {
            return resData(0, '删除失败');
        }

        return resData(1, '删除成功');
    }


    // 获取每个班的任课老师信息
    public function classTeachers(Request $request)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        // $ret = Classes::with('getClasses')->all([1,2,3]);

        $classes = [1, 2, 3, 4, 5, 6, 7, 8];
//        $classes = [1, 2, 3];
        $data = [];
        foreach ($classes as $class) {
            $res['classname'] = $class . '班';
            $teachers = Db::table('teach')
                ->alias('a')
                ->field('b.name,b.account,b.courseid,a.class_id')
                ->join('teachers b', 'a.t_account=b.account')
                ->where('a.class_id', $class)
                ->select();

            $obj = ['yuwen', 'shuxue', 'yinyu', 'huaxue', 'wuli', 'shengwu', 'lishi', 'dili', 'zhengzhi'];
            foreach ($obj as $key => $value) {
                if (count($teachers) != 0) {
                    $res[$value] = $teachers[$key];
                } else {
                    $res[$value] = null;
                }

            }

            Array_push($data, $res);

        }


        //return json($data);
        return resData(1, '获取成功', $data);
    }


    // 获取所有的任课老师
    public function teachersList(Request $request, $type)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        switch ((int)$type) {
            case 1:
                return $this->getTeacher(1);
            case 2:
                return $this->getTeacher(2);
            case 3:
                return $this->getTeacher(3);
            case 4:
                return $this->getTeacher(4);
            case 5:
                return $this->getTeacher(5);
            case 6:
                return $this->getTeacher(6);
            case 7:
                return $this->getTeacher(7);
            case 8:
                return $this->getTeacher(8);
            case 9:
                return $this->getTeacher(9);
        }

        // 获取成功
        // return resData(1,'获取成功',$data);
        // dump($data);
    }

    // 根据课程类型获取所有老师
    public function getTeacher($num)
    {

        $courses = [1 => '语文', 2 => '数学', 3 => '英语', 4 => '化学', 5 => '物理', 6 => '生物', 7 => '历史', 8 => '地理', 9 => '政治'];

        $list = Teachers::field('password', true)->where('courseid', $num)->select();
        if (!$list) {
            return json([
                'success' => 0,
                'course' => null,
                'list' => null
            ]);
        }
        return json([
            'success' => 1,
            'course' => $courses[$num],
            'list' => $list
        ]);

    }


    // 更改指定班级的任课老师
    public function editTeach(Request $request)
    {
        if (!$request->isPost()) {
            return resData(404, '错误请求路径');
        }

        $data = $request->post();
        $classNumber = $data['classname'];
        $accounts = $data['accounts'];

        // 首先删除掉关于这个班的所有teach表的数据
        $delRet = Teach::where('class_id', $classNumber)->delete();
        if (!$delRet) {
            // 删除失败
            return resData(0, '服务器异常');
        }

        $insertData = [];
        foreach ($accounts as $account) {
            $row = [
                't_account' => $account,
                'class_id' => $classNumber
            ];

            array_push($insertData, $row);
        }

        $teach = new Teach();
        $ret = $teach->saveAll($insertData);

        if (!$ret) {
            return resData(0, '服务器异常');
        }

        return resData(1, '更改成功');

    }


    // 根据老师account值获取他教的班级
    public function getClassByAccount(Request $request,$account)
    {
        if (!$request->isGet()) {
            return resData(404, '错误请求路径');
        }

        $ret = Db::table('teach')
            ->alias('a')
            ->join(['teachers'=>'b'],'a.t_account=b.account')
            ->join(['course'=>'c'],'b.courseid=c.id')
            ->where('a.t_account',$account)
            ->field(['b.account','a.class_id','c.name','c.id'])
            ->select();

        if(!$ret) {
            return resData(0,'网络异常');
        }

        return resData(1,'获取成功',$ret);
    }

}
