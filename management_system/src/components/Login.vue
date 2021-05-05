<template>
  <div class="login_box">
    <div class="title">Login</div>
    <el-form :model="loginForm" :rules="rules" ref="loginForm">
      <el-form-item prop="account">
        <el-input
          v-model="loginForm.account"
          placeholder="请输入账号"
        />
      </el-form-item>

      <el-form-item prop="password">
        <el-input
          v-model="loginForm.password"
          placeholder="请输入密码"
          type="password"
        />
      </el-form-item>

      <el-form-item>
        <el-button
          type="primary"
          @click="submitHandle"
          class="loginButton"
        >登陆
        </el-button>
      </el-form-item>
    </el-form>
    <div class="switch">
      <el-switch
        v-model="role"
        active-text="学生"
        inactive-text="老师"
        active-value="1"
        inactive-value="0"
      >
      </el-switch>
    </div>
    <router-link to="/register" class="reg"><i class="el-icon-caret-right"/>注册</router-link>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      role: '1',
      loginForm: {
        account: 't0101001',
        password: '123456'
      },

      rules: {
        account: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 5, max: 15, message: '长度在 5 到 15 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    // 登陆函数
    submitHandle () {
      // 验证表单是否合法
      this.$refs.loginForm.validate(async (valid) => {
        if (!valid) {
          this.$message.error('登录失败!')
          return false
        }

        const { account, password } = this.loginForm
        // 验证成功提交登陆表单
        const { data: res } = await this.$axios.post('/login', {
          account, password, role: this.role
        })

        if (res.success) {
          // 登陆成功
          // 将用户account值role值传递给vuex方便后面使用
          this.$store.commit('updateUserHandle', { account: res.data.account, role: res.data.role })
          // 存储进sessionStorage中
          sessionStorage.setItem('role', res.data.role)
          sessionStorage.setItem('account', res.data.account)
          this.$message.success('登陆成功!')
          // 页面跳转
          if (res.data.role === 'teacher') {
            this.$router.push('/teacher')
            return false
          } else {
            this.$router.push('/student')
            return false
          }
        }

        this.$message.error('登录失败!')
        return false
      })
    }
  }

}
</script>

<style scoped>
.login_box {
  margin: 150px auto;
  height: 400px;
  width: 350px;
  border-radius: 37px;
  background: #f1f1f1;
  -webkit-box-shadow: 27px 27px 54px #bebebe,
  -27px -27px 54px #ffffff;
  box-shadow: 27px 27px 54px #bebebe,
  -27px -27px 54px #ffffff;
  position: relative;
}

.login_box .title {
  color: #001f3f;
  font-size: 70px;
  font-weight: bold;
  position: absolute;
  top: 2px;
  left: -52px;
}

.login_box .switch {
  position: absolute;
  bottom: 99px;
  right: 50px;
}

.login_box .el-form {
  position: absolute;
  bottom: 90px;
  left: 50%;
  -webkit-transform: translate(-50%);
  transform: translate(-50%);
  width: 250px;
}

.login_box .el-form .el-form-item__content .loginButton {
  position: absolute;
  top: 33px;
  left: 50%;
  -webkit-transform: translate(-50%);
  transform: translate(-50%);
}

.login_box .reg {
  position: absolute;
  top: 42px;
  color: #001f3f;
  text-decoration: none;
  font-weight: bold;
  font-size: 14px;
  right: 50px;
}

.login_box .reg:hover {
  color: #409eff;
}
/*# sourceMappingURL=test.css.map */
</style>
