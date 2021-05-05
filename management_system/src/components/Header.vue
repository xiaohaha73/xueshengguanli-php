<template>
<div id="header">
  <div class="main">
    <div class="title">
      <i class="el-icon-postcard"/>
      教务信息系统
    </div>
    <div class="user">
      <span>{{role==='teacher'? '你好老师':'你好同学'}}，</span>
      <el-dropdown @command="handleCommand">
        <el-button type="primary">
          {{name}}<i class="el-icon-arrow-down el-icon--right"></i>
        </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="edit">修改信息</el-dropdown-item>
          <el-dropdown-item command="logout">退出登陆</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'Header',
  props: ['role', 'name'],
  data () {
    return {}
  },
  methods: {
    async handleCommand (command) {
      // console.log(command)

      if (command === 'logout') {
        const { data: res } = await this.$axios.get('/logout')
        if (res.success) {
          this.$message.success(res.msg)
        }

        // 清除vuex中的用户账号和用户类型
        this.$store.commit('updateUserHandle', {
          account: '',
          role: ''
        })

        // 清除sessionStorage值
        sessionStorage.removeItem('role')

        // 重定向到登陆界面
        this.$router.push('/login')
        return false
      }
    }
  }
}
</script>

<style scoped>
#header {
  height: 55px;
  line-height: 55px;
  width: 100%;
  background: #f3f3f4;
  margin-bottom: 20px;
}

#header .main {
  width: 1000px;
  margin: 0 auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -ms-flex-direction: row;
  flex-direction: row;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

#header .main .title {
  padding-left: 80px;
  font-size: 20px;
  font-weight: bold;
  color: #001f3f;
}

#header .main .user {
  color: #409eff;
  font-size: 14px;
  font-weight: bold;
}
/*# sourceMappingURL=test.css.map */
</style>
