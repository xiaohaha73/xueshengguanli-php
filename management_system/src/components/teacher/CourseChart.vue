<template>
<div class="myContainer">
  <div class="title">课程表</div>
  <el-card>
    <el-tabs v-model="activeName" type="card">
      <el-tab-pane
        v-for="(item,index) in classList"
        :key="index"
        :label="item.class_id + '班'"
        :name='String(index)'
      >
        <ClassCourse :class_id="item.class_id"/>
      </el-tab-pane>
    </el-tabs>
  </el-card>

  <div class="fixed-nav">
    <ul>
      <li class="information">
        <i class="el-icon-user-solid"/>
        <span>个人信息</span>
      </li>
      <router-link to="/teacher/grade">
        <li class="chart">
          <i class="el-icon-date"/>
          <span>学生成绩</span>
        </li>
      </router-link>
      <li class="notes">
        <i class="el-icon-tickets"/>
        <span>个人通知</span>
      </li>
    </ul>

  </div>
</div>
</template>

<script>
import ClassCourse from '@/components/teacher/ClassCourse'
export default {
  name: 'CourseChart',
  components: { ClassCourse },
  mounted () {
    // 获取当前教师的班级
    this.getClasses()
  },
  data () {
    return {
      activeName: '0',
      // 存储班级id值
      classList: [],
      // 课程名称
      className: ''
    }
  },
  methods: {
    // 获取当前老师所属的班级
    async getClasses () {
      const account = sessionStorage.getItem('account')
      const { data: res } = await this.$axios.get('/admin/getClassByAccount/' + account)

      if (!res.success) {
        return this.$message.error('网络异常')
      }

      this.classList = res.data
      this.className = res.data[0].name
    }
  }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
</style>
