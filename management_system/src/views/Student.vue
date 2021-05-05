<template>
  <div id="home">
    <div class="main">
      <Header :role="role" :name="name"/>
      <router-view/>
    </div>

  </div>
</template>

<script>
import Header from '@/components/Header'

export default {
  name: 'Home',
  components: {
    Header
  },
  mounted () {
    // 获取学生成绩
    // this.$store.dispatch('asyncGetGrade')
    // 获取sessionStorage中存储的登陆角色，然后根据角色渲染页面
    this.role = sessionStorage.getItem('role')
    this.account = sessionStorage.getItem('account')
    // 获取这个学生的姓名
    this.getName()
  },
  data () {
    return {
      // 角色
      role: 'student', // 默认设置为1学生角色
      name: ''
    }
  },
  methods: {
    async getName () {
      const { data: res } = await this.$axios.get('/admin/getStudent/' + this.account)
      if (!res.success) {
        return this.$message.error('网络异常')
      }
      this.name = res.data.name
      sessionStorage.setItem('classid', res.data.classid)
      // this.$store.commit('updateClassId', res.data.classid)
    }
  }
}
</script>

<style scoped>
#home {
  width: 100%;
  height: 100%;
  background: #ffffff;
}
</style>
