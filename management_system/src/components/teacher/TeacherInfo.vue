<template>
<div class="myContainer">
  <div class="title">个人信息</div>
  <el-card>
    <UserInfo/>
  </el-card>

  <div class="fixed-nav">
    <ul>
      <router-link to="/teacher/grade">
        <li class="information">
          <i class="el-icon-user-solid"/>
          <span>成绩评定</span>
        </li>
      </router-link>
      <router-link to="/teacher/course">
        <li class="chart">
          <i class="el-icon-date"/>
          <span>个人课表</span>
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
import UserInfo from '@/components/UserInfo'
export default {
  name: 'TeacherInfo',
  components: { UserInfo }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
</style>
