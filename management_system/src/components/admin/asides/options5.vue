<template>
<div>
  <el-tabs v-model="activeName" type="card">
    <el-tab-pane label="1班成绩表" name="first">
      <GradeChart :classid="1"/>
    </el-tab-pane>
    <el-tab-pane label="2班成绩表" name="second">
      <GradeChart :classid="2"/>
    </el-tab-pane>
    <el-tab-pane label="3班成绩表" name="third">
      <GradeChart :classid="3"/>
    </el-tab-pane>
    <el-tab-pane label="4班成绩表" name="fourth">
      <GradeChart :classid="4"/>
    </el-tab-pane>
    <el-tab-pane label="5班成绩表" name="fifth">
      <GradeChart :classid="5"/>
    </el-tab-pane>
    <el-tab-pane label="6班成绩表" name="sixth">
      <GradeChart :classid="6"/>
    </el-tab-pane>
    <el-tab-pane label="7班成绩表" name="seventh">
      <GradeChart :classid="7"/>
    </el-tab-pane>
    <el-tab-pane label="8班成绩表" name="eighth">
      <GradeChart :classid="8"/>
    </el-tab-pane>
  </el-tabs>
</div>
</template>

<script>
import GradeChart from '@/components/admin/asides/GradeChart'
export default {
  name: 'options5',
  components: {
    GradeChart
  },
  data () {
    return {
      // 默认选中的页面
      activeName: 'first'
    }
  }
}
</script>

<style scoped>

</style>
