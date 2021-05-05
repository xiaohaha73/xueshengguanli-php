<template>
  <div class="myContainer">
    <div class="title">课后作业</div>
    <el-card>
      <el-tabs v-model="activeName" type="card">
        <el-tab-pane label="语文" name="1">
          <HomeworkChart :class_id="class_id" :course_id="1"/>
        </el-tab-pane>
        <el-tab-pane label="数学" name="2">
          <HomeworkChart :class_id="class_id" :course_id="2"/>
        </el-tab-pane>
        <el-tab-pane label="英语" name="3">
          <HomeworkChart :class_id="class_id" :course_id="3"/>
        </el-tab-pane>
        <el-tab-pane label="化学" name="4">
          <HomeworkChart :class_id="class_id" :course_id="4"/>
        </el-tab-pane>
        <el-tab-pane label="物理" name="5">
          <HomeworkChart :class_id="class_id" :course_id="5"/>
        </el-tab-pane>
        <el-tab-pane label="生物" name="6">
          <HomeworkChart :class_id="class_id" :course_id="6"/>
        </el-tab-pane>
        <el-tab-pane label="历史" name="7">
          <HomeworkChart :class_id="class_id" :course_id="7"/>
        </el-tab-pane>
        <el-tab-pane label="地理" name="8">
          <HomeworkChart :class_id="class_id" :course_id="8"/>
        </el-tab-pane>
        <el-tab-pane label="政治" name="9">
          <HomeworkChart :class_id="class_id" :course_id="9"/>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    <FixedNav/>
  </div>
</template>

<script>
import FixedNav from '@/components/student/FixedNav'
import HomeworkChart from '@/components/student/HomeworkChart'

export default {
  name: 'Homework',
  components: { HomeworkChart, FixedNav },
  data () {
    return {
      activeName: '1',
      class_id: 1
    }
  },
  mounted () {
    // 获取当前学生的class_id
    this.class_id = Number(sessionStorage.getItem('classid'))
  }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";

</style>
