<template>
<div class="container">
  <div class="header">
    <div class="avator">
      <img src="../assets/info_avator.jpg" alt="">
    </div>
    <div class="name_info">
      <div class="name">姓名：<span>{{name}}</span></div>
      <el-switch
        v-model="sex"
        active-text="男"
        inactive-text="女"
        :active-value="1"
        :inactive-value="0"
        @change="sexHandle"
      >
      </el-switch>
    </div>
  </div>
  <div class="form">
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="家庭住址">
        <el-input v-model="form.address"></el-input>
      </el-form-item>
      <el-form-item label="联系电话">
          <el-input v-model="form.phone"></el-input>
      </el-form-item>
      <el-form-item label="出生日期">
          <el-date-picker type="date" placeholder="选择日期" v-model="form.birthday" style="width: 100%;"></el-date-picker>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">更改信息</el-button>
      </el-form-item>
    </el-form>
  </div>
</div>
</template>

<script>
export default {
  name: 'UserInfo',
  mounted () {
    // 获取个人信息
    this.getData()
  },
  data () {
    return {
      sex: 1,
      name: '',
      form: {
        address: '',
        phone: '',
        birthday: '',
        email: ''
      },
      account: '',
      role: ''
    }
  },
  methods: {
    // 获取个人信息
    async getData () {
      const account = sessionStorage.getItem('account')
      const role = sessionStorage.getItem('role')
      this.account = account
      this.role = role
      const { data: res } = await this.$axios.get('/getUserInfo/' + account)
      if (!res.success) {
        return this.$message.error('网络异常请稍后重试')
      }

      const { address, phone, birthday, email } = res.data
      this.form = { address, phone, birthday, email }

      // 获取性别
      const { data: user } = await this.$axios.get('/getSex/' + role + '/' + account)
      if (!user.success) {
        return this.$message.error('网络异常请稍后重试')
      }

      this.sex = user.data.sex
      this.name = user.data.name
    },
    // 更改性别的函数
    async sexHandle () {
      // console.log(this.sex)

      const { data: res } = await this.$axios.post('/editSex', {
        role: this.role,
        sex: this.sex,
        account: this.account
      })

      if (!res.success) {
        return this.$message.error('网络异常请稍后重试')
      }
    },
    // 提交函数
    async onSubmit () {
      const { address, birthday, email, phone } = this.form
      const { data: res } = await this.$axios.post('/updateUserInfo', {
        address,
        birthday,
        email,
        phone,
        account: this.account
      })

      if (!res.success) {
        return this.$message.error('网络异常请稍后重试')
      }

      this.getData()
      return this.$message.success('更改成功')
    }
  }
}
</script>

<style scoped>
.container {
  width: 450px;
  margin: 0 auto;
}

.container .header {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -ms-flex-direction: row;
  flex-direction: row;
  -ms-flex-pack: distribute;
  justify-content: space-around;
  height: 100px;
}

.container .header .avator img {
  width: 100px;
  height: 100px;
}

.container .header .name_info {
  width: 150px;
  position: relative;
}

.container .header .name_info .name {
  font-size: 16px;
  font-weight: bolder;
  position: absolute;
  top: 18px;
  left: 20px;
}

.container .header .name_info .name span {
  color: #409eff;
  font-size: 17px;
}

.container .header .name_info .el-switch {
  position: absolute;
  top: 60px;
  left: 20px;
}

.container .form {
  margin-top: 30px;
}
</style>
