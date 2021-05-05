<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


// 允许所有的跨域请求
Route::get('col/:id', 'Collect/read')->allowCrossDomain();


Route::group('/api', function () {

    // 测试接口
    Route::get('/hello', 'login/Login/hello');


    // 登陆验证请求
    Route::post('/login', 'login/Login/login');


    // 检查登陆状态接口
    Route::get('/checkLogin', 'login/Login/checkLogin');

    // 退出登陆接口
    Route::get('/logout', 'login/Login/logout');


    // 注册新用户验证码接口
    // 发送验证码
    Route::get('/captcha', 'login/Register/captcha');

    // 注册新用户请求
    Route::post('/register', 'login/Register/reg');


    // 获取用户姓名的接口
    Route::get('/getName/:role/:account','user/User/getName');

    // 根据account获取用户的个人信息
    Route::get('/getUserInfo/:account','user/User/getUserInfo');

    // 获取用户性别
    Route::get('/getSex/:role/:account','user/User/getSex');

    // 更改用户性别
    Route::post('/editSex','user/User/editSex');

    // 更新用户的个人信息
    Route::post('/updateUserInfo','user/User/updateUserInfo');

    // 管理员接口
    Route::group('/admin', function () {


        // 管理员登陆接口
        Route::post('/login', 'admin/Admin/login');

        // 验证管理员是否登录的接口
        Route::get('/checklogin', 'admin/Admin/checkLogin');

        // 退出登陆接口
        Route::get('/logout', 'admin/Admin/logout');

        // 获取管理员信息的接口
        Route::get('/getadmin/:id', 'admin/Admin/getAdmin');


        // 获取学生数据的接口
        Route::get('/getStudents/:page/:size', 'admin/Student/getStudents');

        // 根据account获取学生信息
        Route::get('/getStudent/:account', 'admin/Student/getStudentById');

        // 删除学生的接口
        Route::get('/deleteStudent/:account', 'admin/Student/deleteStudent');

        // 更新学生的接口
        Route::post('/updateStudent', 'admin/Student/updateStudent');




        // 获取老师的接口
        Route::get('/getTeachers/:page/:size', 'admin/Teacher/getTeachers');

        // 根据account值查找老师
        Route::get('/getTeachers/:account', 'admin/Teacher/getTeacherById');

        // 根据name值查询老师
        Route::get('/getTeacher/:name', 'admin/Teacher/getTeacherByName');

        // 添加老师的接口
        Route::post('/addTeacher', 'admin/Teacher/addTeacher');

        // 编辑老师的接口
        Route::post('/updateTeacher', 'admin/Teacher/updateTeacher');

        // 删除老师
        Route::get('/deleteTeacher/:account', 'admin/Teacher/deleteTeacher');

        // 获取每个班的任课教师的信息
        Route::get('/classTeachers', 'admin/Teacher/classTeachers');

        // 获取所有的任课老师
        Route::get('/teachersList/:type', 'admin/Teacher/teachersList');

        // 更改班级的任课老师
        Route::post('/editTeach', 'admin/Teacher/editTeach');

        // 根据account值获取教师的任课班级
        Route::get('/getClassByAccount/:account','admin/Teacher/getClassByAccount');


        // 获取每个班的课程安排
        Route::get('/getSchedule/:classid','admin/Schedule/getSchedule');

        // 更改对应班级的课程
        Route::post('/editSchedule','admin/Schedule/editSchedule');



        // 根据班级id值获取这个班学生的成绩
        Route::get('/getGrade/:classid','admin/Grade/getGrade');

        // account值更新学生的成绩
        Route::post('/editGrade','admin/Grade/editGrade');

        // 根据account值更新某一个科目的成绩
        Route::post('/editScore','admin/Grade/editScore');

        // 根据account值获取某个学生的成绩
        Route::get('/getStudentGrade/:account','admin/Grade/getStudentGrade');



        // 根据班级id和课程id获取作业数据
        Route::get('/getHomeWork/:classid/:courseid','admin/Homework/getHomework');

        //添加作业接口
        Route::post('/addHomework','admin/Homework/addHomework');

    });

});







