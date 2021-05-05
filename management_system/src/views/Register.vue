<template>
  <div id="Register">
    <div class="reg_box">
      <div class="title">Register</div>

      <el-form :model="regForm" :rules="rules" ref="regForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="学生姓名" prop="name">
          <el-input v-model="regForm.name"></el-input>
        </el-form-item>

        <el-form-item label="学号" prop="account">
          <el-input v-model="regForm.account"></el-input>
        </el-form-item>

        <el-form-item label="密码" prop="password">
          <el-input v-model="regForm.password" type="password"></el-input>
        </el-form-item>

        <el-form-item label="确认密码" prop="rPassword">
          <el-input v-model="regForm.rPassword" type="password"></el-input>
        </el-form-item>
        <el-form-item label="班级" prop="classid">
          <el-select v-model="regForm.classid" placeholder="请选择班级">
            <el-option label="1班" value="1"></el-option>
            <el-option label="2班" value="2"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="输入验证码" prop="captcha" class="captcha">
          <el-input v-model="regForm.captcha"></el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('regForm')">立即注册</el-button>
          <el-button @click="resetForm('regForm')">重置</el-button>
        </el-form-item>
      </el-form>
      <div class="captchaImg" @click="relushCaptcha">
        <img
            src="http://127.0.0.1:8080/api/captcha"
            alt="captcha"
            ref="captcha"
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Register',

  data () {
    return {
      regForm: {
        name: '',
        account: '',
        password: '',
        rPassword: '',
        classid: '',
        captcha: ''
      },
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
          { min: 2, max: 4, message: '长度在 2 到 4 个字符', trigger: 'blur' }
        ],
        account: [
          { required: true, message: '请输入学号', trigger: 'blur' },
          { min: 5, max: 15, message: '长度在 5 到 15 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
        ],
        rPassword: [
          { required: true, message: '请输入确认密码', trigger: 'blur' },
          { min: 5, max: 20, message: '长度在 5 到 20 个字符', trigger: 'blur' }
        ],

        classid: [
          { required: true, message: '请选择班级', trigger: 'change' }
        ],

        captcha: [
          { required: true, message: '请输入验证码', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {

    // 控制验证码重新刷新
    relushCaptcha () {
      this.$refs.captcha.src = 'http://127.0.0.1:8080/api/captcha'
    },

    submitForm (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          // 验证通过情况
          const { data: res } = await this.$axios.post('/register', {
            name: this.regForm.name,
            account: this.regForm.account,
            password: this.regForm.password,
            rPassword: this.regForm.rPassword,
            classid: Number(this.regForm.classid),
            captcha: this.regForm.captcha
          })

          if (res.success === 1) {
            this.$message({
              message: '注册成功',
              type: 'success'
            })
            // 跳转到登陆界面
            this.$router.push('/login')
            return 0
          } else if (res.success === 3) {
            this.$message('该用户已经注册！')
            // eslint-disable-next-line no-unreachable
            this.$router.push('/login')
            return 0
          } else {
            return this.$message.error('注册失败，请稍后重试')
          }
        } else {
          // console.log('error submit!!');
          this.$message.error('注册失败，请稍后重试')
          return false
        }
      })
    },
    // 重置表单函数
    resetForm (formName) {
      this.$refs[formName].resetFields()
    }
  }

}
</script>

<style scoped>
#Register {
  background: #f1f1f1;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

#Register .reg_box {
  margin: 100px auto;
  height: 500px;
  width: 570px;
  border-radius: 37px;
  background: #f1f1f1;
  -webkit-box-shadow: 27px 27px 54px #bebebe,
  -27px -27px 54px #ffffff;
  box-shadow: 27px 27px 54px #bebebe,
  -27px -27px 54px #ffffff;
  position: relative;
}

#Register .reg_box .title {
  color: #001f3f;
  font-size: 70px;
  font-weight: bold;
  position: absolute;
  top: -40px;
  left: 50%;
  -webkit-transform: translate(-50%);
  transform: translate(-50%);
}

#Register .reg_box .el-form {
  position: absolute;
  bottom: -5px;
  left: 46%;
  -webkit-transform: translate(-50%);
  transform: translate(-50%);
  width: 410px;
}

#Register .reg_box .el-form .captcha .el-input {
  width: 50%;
}

#Register .reg_box .captchaImg {
  height: 40px;
  width: 140px;
  position: absolute;
  cursor: pointer;
  right: 103px;
  bottom: 78px;
}

#Register .reg_box .captchaImg img {
  width: 100%;
}
/*# sourceMappingURL=test.css.map */

</style>
