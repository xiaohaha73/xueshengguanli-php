<template>
  <div class="myContainer">
    <div class="title">{{classid}}班课程表</div>
    <el-card>
      <el-table
        :data="tableData"
        border
        style="width: 100%"
        :cell-style="{'text-align':'center'}"
        :header-cell-style="{'text-align':'center'}"
      >
        <el-table-column
          prop="date"
          label="时间"
          width="180">
        </el-table-column>
        <el-table-column
          prop="a"
          label="星期一"
          width="180">
        </el-table-column>
        <el-table-column
          prop="b"
          label="星期二">
        </el-table-column>
        <el-table-column
          prop="c"
          label="星期三">
        </el-table-column>
        <el-table-column
          prop="d"
          label="星期四">
        </el-table-column>
        <el-table-column
          prop="e"
          label="星期五">
        </el-table-column>
      </el-table>
    </el-card>

    <div class="fixed-nav">
      <ul>
        <li class="information">
          <i class="el-icon-user-solid"/>
          <span>个人信息</span>
        </li>
        <router-link to="/student/grade">
          <li class="chart">
            <i class="el-icon-date"/>
            <span>个人成绩</span>
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
export default {
  name: 'CourseForm',
  data () {
    return {
      tableData: [],
      classid: 1 // 学生的班级
    }
  },
  mounted () {
    this.getData()
  },
  methods: {
    // 获取学生的课程表
    async getData () {
      this.classid = sessionStorage.getItem('classid')
      const { data: res } = await this.$axios.get('/admin/getSchedule/' + this.classid)
      if (!res.success) {
        return this.$message.error('网络异常')
      }

      this.tableData = res.data
    }
  }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
</style>
