<template>
  <div id="Login">
    <div class="form_box">
      <UserLogin v-if="loginToogle"/>
      <AdminLogin v-if="!loginToogle"/>
      <div class="login_nav"
            @click='loginToogle = !loginToogle'
      >
        <i class="el-icon-right" v-if="loginToogle">管理员登陆</i>
        <i class="el-icon-back" v-else>普通登陆</i>
      </div>
    </div>
  </div>
</template>

<script>

import UserLogin from '@/components/Login'
import AdminLogin from '@/components/admin/AdminLogin'

export default {
  name: 'Login',
  components: {
    UserLogin,
    AdminLogin
  },
  mounted () {

  },

  data () {
    return {
      loginToogle: true // 控制普通登陆界面还是管理员界面
    }
  },
  methods: {

  }

}
</script>

<style scoped>
#Login {
  background: #f1f1f1;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

#Login .form_box {
  position: relative;
}

#Login .form_box .login_nav {
  position: absolute;
  bottom: -38px;
  left: 50%;
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
  color: #409eff;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

#Login .form_box .login_nav i {
  font-weight: bold;
}

#Login .form_box .login_nav:hover {
  color: #001f3f;
}
</style>
