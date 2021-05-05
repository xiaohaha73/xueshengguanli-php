import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)
export default new Vuex.Store({
  state: {
    // 用户的账号值
    account: '',
    // 用户类型
    role: 'student', // 默认设置为student
    // 查询账号获取到的用户具体信息
    user: {
      name: ''
    },

    // 如果是学生状态下的班级id
    classid: '',

    // 存储的学生成绩
    studentInfo: {}

  },
  mutations: {
    // 更改用户类型和用户账号值的函数
    updateUserHandle (state, user) {
      const { account, role } = user
      state.account = account
      state.role = role
    },

    // 获取用户的具体信息的函数
    getUser (state, data) {
      const { name } = data
      state.user.name = name
      // console.log(data)
    },

    updateClassId (state, data) {
      state.classid = data
    },

    // 存储学生成绩
    getGrade (state, data) {
      state.studentInfo = data
    }

  },
  actions: {
    // 通过axios获取用户的具体信息
    // param = {role , account} 角色 账号
    async asyncGetUser (state, param) {
      // 根据用户类型请求数据
      if (param.role === 'admin') { // 管理员身份
        const { data: res } = await axios.get('/admin/getadmin/' + param.account)
        if (!res.success) {
          // 未请求到数据，设置具体的数据为空
          return state.commit('getUser', {})
        }

        // 请求到了数据
        return state.commit('getUser', res.data)
      }
    },

    // 获取学生的成绩信息
    async asyncGetGrade (state) {
      const account = sessionStorage.getItem('account')
      const { data: res } = await axios.get('/admin/getStudentGrade/' + account)
      if (!res.success) {
        return state.commit('getGrade', {})
      }

      // console.log(res)
      return state.commit('getGrade', res.data)
    }

  },
  modules: {
  }
})
