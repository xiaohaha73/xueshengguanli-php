<template>
<div>
  <el-tabs v-model="activeName" type="card">
    <el-tab-pane label="1班课程表" name="first">
      <CourseChart :classid="1"/>
    </el-tab-pane>
    <el-tab-pane label="2班课程表" name="second">
      <CourseChart :classid="2"/>
    </el-tab-pane>
    <el-tab-pane label="3班课程表" name="third">
      <CourseChart :classid="3"/>
    </el-tab-pane>
    <el-tab-pane label="4班课程表" name="fourth">
      <CourseChart :classid="4"/>
    </el-tab-pane>
    <el-tab-pane label="5班课程表" name="fifth">
      <CourseChart :classid="5"/>
    </el-tab-pane>
    <el-tab-pane label="6班课程表" name="sixth">
      <CourseChart :classid="6"/>
    </el-tab-pane>
    <el-tab-pane label="7班课程表" name="seventh">
      <CourseChart :classid="7"/>
    </el-tab-pane>
    <el-tab-pane label="8班课程表" name="eighth">
      <CourseChart :classid="8"/>
    </el-tab-pane>
  </el-tabs>
</div>
</template>

<script>
import CourseChart from '@/components/admin/asides/CourseChart'
export default {
  name: 'options4',
  components: {
    CourseChart
  },
  data () {
    return {
      // 默认选中的页面
      activeName: 'first'
    }
  },
  methods: {
  }
}
</script>

<style scoped>

</style>
