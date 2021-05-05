<template>
  <div>
    <div class="title">个人信息</div>
    <el-card>
      <UserInfo/>
    </el-card>
    <div class="myContainer">
      <div class="fixed-nav">
        <ul>
          <router-link to="/student/grade">
            <li class="information">
              <i class="el-icon-user-solid"/>
              <span>个人成绩</span>
            </li>
          </router-link>
          <router-link to="/student/course">
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
  </div>
</template>

<script>
import UserInfo from '@/components/UserInfo'

export default {
  name: 'StudentInfo',
  components: {UserInfo}
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
</style>
