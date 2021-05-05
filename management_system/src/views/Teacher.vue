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
    // 获取sessionStorage中存储的登陆角色，然后根据角色渲染页面
    this.role = sessionStorage.getItem('role')
    this.account = sessionStorage.getItem('account')
    // 获取这个老师的姓名
    this.getName()
  },
  data () {
    return {
      // 角色
      role: 'teacher', // 默认设置为1学生角色
      name: '' // 用户的名字
    }
  },
  methods: {
    async getName () {
      const { data: res } = await this.$axios.get('/getName/teacher/' + this.account)
      if (!res.success) {
        return this.$message.error('网络异常')
      }
      this.name = res.data.name
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
