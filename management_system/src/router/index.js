import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '@/views/Login'
import Register from '@/views/Register'

// 前台
import Teacher from '@/views/Teacher'
import Student from '@/views/Student'
import StudentsPlatform from '@/components/StudentsPlatform'
import TeacherPlatform from '@/components/TeacherPlatform'

// 后台管理界面
import Admin from '@/views/admin/Home'
import defaultPage from '@/components/admin/asides/default'
import options1 from '@/components/admin/asides/options1'
import options2 from '@/components/admin/asides/options2'
import options3 from '@/components/admin/asides/options3'
import options4 from '@/components/admin/asides/options4'
import options5 from '@/components/admin/asides/options5'
import addStudent from '@/components/admin/asides/addStudent'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/login'
  },

  {
    path: '/teacher',
    redirect: '/teacher/index'
  },
  {
    path: '/student',
    redirect: '/student/index'
  },

  // 老师界面
  {
    path: '/teacher',
    component: Teacher,
    children: [
      {
        path: '/teacher/index',
        name: 'TeachersPlatform',
        component: TeacherPlatform
      },
      { // 更改学生成绩界面
        path: '/teacher/grade',
        name: 'EditGrade',
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../components/teacher/EditGrade')
      },
      {
        // 课程表界面
        path: '/teacher/course',
        name: 'CourseChart',
        component: () => import(/* webpackChunkName: "about" */ '../components/teacher/CourseChart')
      },
      {
        // 布置作业界面
        path: '/teacher/homework',
        name: 'HomeWork',
        component: () => import(/* webpackChunkName: "about" */ '../components/teacher/HomeWork')
      },
      {
        // 个人信息界面
        path: '/teacher/info',
        name: 'TeacherInfo',
        component: () => import(/* webpackChunkName: "about" */ '../components/teacher/TeacherInfo')
      }
    ],
    beforeEnter: (to, from, next) => {
      const role = window.sessionStorage.getItem('role')
      if (role === 'teacher') {
        next()
      } else {
        next('/login')
      }
    }
  },

  // 学生界面

  {
    path: '/student',
    component: Student,
    children: [
      {
        path: '/student/index',
        name: 'StudentsPlatform',
        component: StudentsPlatform
      },
      {
        // 成绩表界面
        path: '/student/grade',
        name: 'GradeForm',
        component: () => import(/* webpackChunkName: "about" */ '../components/student/GradeForm')
      },
      {
        // 课程表界面
        path: '/student/course',
        name: 'CourseForm',
        component: () => import(/* webpackChunkName: "about" */ '../components/student/CourseForm')
      },
      {
        // 学生作业界面
        path: '/student/homework',
        name: 'Homework',
        component: () => import(/* webpackChunkName: "about" */ '../components/student/Homework')
      },
      {
        // 学生信息界面
        path: '/student/info',
        name: 'StudentInfo',
        component: () => import(/* webpackChunkName: "about" */ '../components/student/StudentInfo')
      }
    ],
    beforeEnter: (to, from, next) => {
      const role = window.sessionStorage.getItem('role')
      if (role === 'student') {
        next()
      } else {
        next('/login')
      }
    }

  },



  { // 登录界面
    path: '/login',
    name: 'Login',
    component: Login
  },

  { // 注册界面
    path: '/register',
    name: 'Register',
    component: Register
  },


  // 管理员后台界面

  {
    path: '/admin', // 设置默认初始页面
    redirect: '/admin/default'
  },

  {
    path: '/admin',
    name: 'Admin',
    component: Admin,
    children: [
      {
        path: '/admin/default',
        component: defaultPage
      },
      {
        path: '/admin/options1',
        component: options1
      },
      {
        path: '/admin/options2',
        component: options2
      },
      {
        path: '/admin/options3',
        component: options3
      },
      {
        path: '/admin/options4',
        component: options4
      },
      {
        path: '/admin/options5',
        component: options5
      },

      { // 添加学生界面
        path: '/admin/addstudent',
        name: addStudent,
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../components/admin/asides/addStudent')
      },

      { // 编辑学生页面
        path: '/admin/editstudent',
        name: 'editStudent',
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "about" */ '../components/admin/asides/editStudent')
      },

      { // 添加老师页面
        path: '/admin/addteacher',
        name: 'addTeacher',
        component: () => import(/* webpackChunkName: "about" */ '../components/admin/asides/addTeacher')
      },

      { // 编辑老师页面
        path: '/admin/editteacher',
        name: 'editTeacher',
        component: () => import(/* webpackChunkName: "about" */ '../components/admin/asides/editTeacher')

      },

      { // 更改任课教师的界面
        path: '/admin/editteach',
        name: 'editTeach',
        component: () => import(/* webpackChunkName: "about" */ '../components/admin/asides/editTeach')

      }

    ],
    beforeEnter: (to, from, next) => {
      const role = window.sessionStorage.getItem('role')
      if (role === 'admin') {
        next()
      } else {
        next('/login')
      }
    }
  }

]

const router = new VueRouter({
  routes
})

export default router
