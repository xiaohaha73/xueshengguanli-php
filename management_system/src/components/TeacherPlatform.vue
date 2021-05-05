<template>
  <div id="teacher">
    <!--左侧区域-->
    <div class="application">
      <div class="title">教师桌面</div>
      <!--常用功能-->
      <div class="usedApp application_box">
        <AppTitle title="常用功能"/>
        <ul>
          <RouterLink to="/teacher/grade">
            <li><i class="el-icon-tickets"/><span>成绩评定</span></li>
          </RouterLink>
          <RouterLink to="/teacher/homework">
            <li><i class="el-icon-s-custom"/>布置作业</li>
          </RouterLink>
          <RouterLink to="/teacher/course">
            <li><i class="el-icon-date"/>课表查询</li>
          </RouterLink>
        </ul>
      </div>
      <!--工具箱-->
      <div class="tool application_box">
        <AppTitle title="工具箱"/>
        <ul>
          <li><i class="el-icon-s-data"/><span>学籍管理</span></li>
        </ul>
      </div>
    </div>

    <!--右侧区域-->
    <div class="application">
      <!--常用功能-->
      <div class="usedApp application_box">
        <AppTitle title="最近使用"/>
        <ul>
          <RouterLink to="/teacher/grade">
            <li><i class="el-icon-tickets"/><span>成绩评定</span></li>
          </RouterLink>
          <RouterLink to="/teacher/homework">
            <li><i class="el-icon-s-custom"/>布置作业</li>
          </RouterLink>
          <RouterLink to="/teacher/course">
            <li><i class="el-icon-date"/>课表查询</li>
          </RouterLink>
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
    <FixedNav/>
  </div>
</template>
<script>
// 导入标题组件
import AppTitle from '@/components/AppTitle'
// 导入左侧悬浮导航栏
import FixedNav from '@/components/teacher/FixedNav'
export default {
  name: 'TeachersPlatform',
  components: {
    AppTitle,
    FixedNav
  }
}
</script>

<style scoped>

#teacher {
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

#teacher .application {
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
  position: relative;
}

#teacher .application .title {
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
  font-size: 14px;
  position: absolute;
  top: -56px;
  left: 0;
}

#teacher .application .usedApp {
  height: 240px;
  background: #f3f3f4;
}

#teacher .application .tool {
  margin-top: 15px;
  height: 240px;
  background: #f3f3f4;
}

#teacher .application .application_box {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
}

#teacher .application .application_box ul {
  width: 100%;
  margin: 0;
  -webkit-padding-start: 0;
  padding-inline-start: 0;
}

#teacher .application .application_box ul li {
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

#teacher .application .application_box ul li:hover {
  background: #f8dfc7;
}

#teacher .application .application_box ul li i {
  top: 12px;
  left: 42px;
  position: absolute;
  font-size: 30px;
}
/*# sourceMappingURL=test.css.map */

</style>
