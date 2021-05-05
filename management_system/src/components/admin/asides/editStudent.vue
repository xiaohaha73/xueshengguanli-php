<template>
  <div class="submitFrom">
    <div class="form_box">
      <div class="title">编辑学生</div>

      <el-form :model="editForm" :rules="rules" ref="editForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="学生姓名" prop="name">
          <el-input v-model="editForm.name"></el-input>
        </el-form-item>

        <el-form-item label="学号" prop="account">
          <el-input v-model="editForm.account"></el-input>
        </el-form-item>
        <el-form-item label="班级" prop="classid">
          <el-select v-model="editForm.classid" placeholder="请选择班级">
            <el-option label="1班" value="1"></el-option>
            <el-option label="2班" value="2"></el-option>
            <el-option label="3班" value="3"></el-option>
            <el-option label="4班" value="4"></el-option>
            <el-option label="5班" value="5"></el-option>
            <el-option label="6班" value="6"></el-option>
            <el-option label="7班" value="7"></el-option>
            <el-option label="8班" value="8"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm()">提交更改</el-button>
          <el-button type="info" plain @click="cancelHandle">取消更改</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'editStudent',
  async mounted () {
    // 接收路由传递过来的参数
    const id = this.$route.query.account
    // 根据账号查找信息
    const { data: res } = await this.$axios.get('/admin/getStudent/' + id)

    if (!res.success) {
      return this.$message.error('数据异常')
    }

    const { name, account, classid } = res.data
    this.editForm.name = name
    this.editForm.account = account
    this.editForm.classid = classid + '班'
  },
  data () {
    return {
      editForm: {
        name: '',
        account: '',
        classid: ''
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

        classid: [
          { required: true, message: '请选择班级', trigger: 'change' }
        ]
      }
    }
  },
  methods: {
    // 表单提交函数
    submitForm () {
      this.$refs.editForm.validate(async (valid) => {
        if (!valid) {
          this.$message.error('提交数据有误！')
        }

        const newid = Number(this.editForm.classid.substr(0, 1))
        const { data: res } = await this.$axios.post('/admin/updateStudent', {
          name: this.editForm.name,
          account: this.editForm.account,
          classid: newid
        })

        if (!res.success) {
          return this.$message.error('提交数据失败！')
        }

        this.$message.success('提交数据成功!')
        this.$router.push('/admin/options1')
      })
    },

    // 取消更改按钮
    cancelHandle () {
      this.$router.push('/admin/options1')
    }

  }

}
</script>

<style scoped>
@import "~@/components/style/submitFromStyle.css";

.el-form {
  top: 150px;
}

</style>
