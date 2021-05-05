<template>
  <div class="fixed-nav">
    <ul>
      <router-link to="/teacher/info">
        <li class="information">
          <i class="el-icon-user-solid"/>
          <span>个人信息</span>
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
</template>

<script>
export default {
  name: 'fixedNav'
}
</script>

<style scoped>
.fixed-nav {
  position: fixed;
  left: 20px;
  top: 261px;
}

.fixed-nav ul li {
  padding-top: 10px;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  text-align: center;
  height: 60px;
  width: 60px;
  background: #d9ecff;
  color: #409eff;
  font-size: 13px;
  font-weight: bold;
  cursor: pointer;
}

.fixed-nav ul li i {
  font-size: 15px;
  margin-bottom: 7px;
}

.fixed-nav ul li:hover {
  background: #409eff;
  color: white;
}

.fixed-nav ul li:nth-child(2), .fixed-nav ul li:nth-child(3) {
  border-top: 1px solid white;
}
/*# sourceMappingURL=test.css.map */
</style>
