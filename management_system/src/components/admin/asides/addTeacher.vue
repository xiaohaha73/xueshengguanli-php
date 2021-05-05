<template>
  <div id="addStudent" class="submitFrom">
    <div class="form_box">
      <div class="title">添加新老师</div>

      <el-form :model="addForm" :rules="rules" ref="addForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="老师姓名" prop="name">
          <el-input v-model="addForm.name"></el-input>
        </el-form-item>

        <el-form-item label="工号" prop="account">
          <el-input v-model="addForm.account"></el-input>
        </el-form-item>

        <el-form-item label="密码" prop="password">
          <el-input v-model="addForm.password" type="password"></el-input>
        </el-form-item>

        <el-form-item label="确认密码" prop="rPassword">
          <el-input v-model="addForm.rPassword" type="password"></el-input>
        </el-form-item>
        <el-form-item label="教授的课程" prop="classid">
          <el-select v-model="addForm.courseid" placeholder="请选择课程">
            <el-option label="语文" :value="1"></el-option>
            <el-option label="数学" :value="2"></el-option>
            <el-option label="英语" :value="3"></el-option>
            <el-option label="化学" :value="4"></el-option>
            <el-option label="物理" :value="5"></el-option>
            <el-option label="生物" :value="6"></el-option>
            <el-option label="历史" :value="7"></el-option>
            <el-option label="地理" :value="8"></el-option>
            <el-option label="政治" :value="9"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('addForm')">添加</el-button>
          <el-button @click="resetForm('addForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'addTeacher',
  data () {
    return {
      addForm: {
        name: '',
        account: '',
        password: '',
        rPassword: '',
        courseid: ''
      },
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
          { min: 2, max: 4, message: '长度在 2 到 4 个字符', trigger: 'blur' }
        ],
        account: [
          { required: true, message: '请输入工号', trigger: 'blur' },
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

        courseid: [
          { required: true, message: '请选择课程', trigger: 'change' }
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          // 验证通过情况
          const { data: res } = await this.$axios.post('/admin/addTeacher', {
            name: this.addForm.name,
            account: this.addForm.account,
            password: this.addForm.password,
            rPassword: this.addForm.rPassword,
            courseid: this.addForm.courseid
          })

          // console.log(res)
          // return false

          if (res.success === 1) {
            this.$message({
              message: '注册成功',
              type: 'success'
            })
            // 跳转到登陆界面
            this.$router.push('/admin/options2')
            return 0
          } else if (res.success === 3) {
            this.$message('该用户已经存在！')
            this.$router.push('/admin/options2')
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
@import "~@/components/style/submitFromStyle.css";
.el-form {
  bottom: 20px !important;
}
</style>
