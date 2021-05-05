<template>
  <div id="student">
    <!--左侧区域-->
    <div class="student-left">
      <div class="title">学生桌面</div>
      <div class="score">
        <AppTitle title="平时成绩"/>

        <!--成绩图表-->
        <div id="myEcharts" style="width:460px;height:350px;margin-left: 20px;margin-top: 100px"/>
      </div>
    </div>

    <!--右侧区域-->
    <div class="student-right">
      <!--常用功能-->
      <div class="usedApp application_box">
        <AppTitle title="常用功能"/>
        <ul>
          <router-link to="/student/grade">
            <li><i class="el-icon-tickets"/><span>成绩查询</span></li>
          </router-link>
          <router-link to="/student/info">
            <li><i class="el-icon-s-custom"/>个人信息</li>
          </router-link>
          <router-link to="/student/course">
            <li><i class="el-icon-date"/>课表查询</li>
          </router-link>
          <router-link to="/student/homework">
            <li><i class="el-icon-tickets"/>作业通知</li>
          </router-link>
        </ul>
      </div>
      <!--工具箱-->
      <div class="tool application_box">
        <AppTitle title="工具箱"/>
        <ul>
          <li><i class="el-icon-s-data"/><span>成绩分析</span></li>
        </ul>
      </div>
    </div>

    <!--悬浮功能区-->
    <div class="fixed-nav">
      <ul>
        <router-link to="/student/info">
          <li class="information">
            <i class="el-icon-user-solid"/>
            <span>个人信息</span>
          </li>
        </router-link>
        <router-link to="/student/course">
          <li class="chart">
            <i class="el-icon-date"/>
            <span>个人课表</span>
          </li>
        </router-link>
        <router-link to="/student/homework">
          <li class="notes">
            <i class="el-icon-tickets"/>
            <span>作业通知</span>
          </li>
        </router-link>
      </ul>

    </div>
  </div>
</template>
<script>
// 导入标题组件
import AppTitle from '@/components/AppTitle'

export default {
  name: 'StudentsPlatform',
  components: {
    AppTitle
  },

  mounted () {
    // 调用初始化echarts的函数
    this.initEcharts()
  },
  data () {
    return {
      // 获取到的学生成绩
      grade: []
    }
  },

  methods: {
    // 初始化echarts的函数
    async initEcharts () {
      const account = sessionStorage.getItem('account')
      const { data: res } = await this.$axios.get('/admin/getStudentGrade/' + account)

      if (!res.success) {
        return this.$message.error('网络异常')
      }

      const { name, a, b, c, d, e, f, g, h, i } = res.data
      // 基于准备好的dom，初始化echarts实例
      const echarts = require('echarts')
      const myChart = echarts.init(document.getElementById('myEcharts'))
      // 绘制图表
      myChart.setOption({
        title: { text: name },
        tooltip: {},
        xAxis: {
          data: ['语文', '数学', '英语', '化学', '物理', '生物', '历史', '地理', '政治']
        },
        yAxis: {},
        series: [{
          name: '分数',
          type: 'bar',
          data: [a, b, c, d, e, f, g, h, i]
        }]
      })
    }
  }

}
</script>

<style scoped>

#student {
  width: 1000px;
  height: 100%;
  margin: 0 auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -ms-flex-direction: row;
  flex-direction: row;
  padding-top: 10px;
  position: relative;
}

#student .student-left {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  padding-right: 10px;
}

#student .student-left .title {
  cursor: pointer;
  height: 35px;
  width: 100px;
  background: #d9ecff;
  line-height: 31px;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  text-align: center;
  color: #001f3f;
  border-bottom: 3px solid #409eff;
  margin-bottom: 15px;
  font-size: 14px;
}

#student .student-left .score {
  background: #f3f3f4;
  height: 495px;
}

#student .student-right {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  margin-top: 50px;
  margin-left: 10px;
}

#student .student-right .usedApp {
  height: 240px;
  background: #f3f3f4;
}

#student .student-right .tool {
  margin-top: 15px;
  height: 240px;
  background: #f3f3f4;
}

#student .student-right .application_box {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
}

#student .student-right .application_box ul {
  width: 100%;
  margin: 0;
  -webkit-padding-start: 0;
  padding-inline-start: 0;
}

#student .student-right .application_box ul li {
  position: relative;
  text-align: center;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  width: 245px;
  height: 52px;
  line-height: 52px;
  display: block;
  background: #faecd8;
  float: left;
  border: 1px solid white;
  cursor: pointer;
  color: #e6a23c;
}

#student .student-right .application_box ul li:hover {
  background: #f8dfc7;
}

#student .student-right .application_box ul li i {
  top: 12px;
  left: 42px;
  position: absolute;
  font-size: 30px;
}

#student .fixed-nav {
  position: fixed;
  left: 20px;
  top: 261px;
}

#student .fixed-nav ul li {
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

#student .fixed-nav ul li i {
  font-size: 15px;
  margin-bottom: 7px;
}

#student .fixed-nav ul li:hover {
  background: #409eff;
  color: white;
}

#student .fixed-nav ul li:nth-child(2), #student .fixed-nav ul li:nth-child(3) {
  border-top: 1px solid white;
}


</style>
