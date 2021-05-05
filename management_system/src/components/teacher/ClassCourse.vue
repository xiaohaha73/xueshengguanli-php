<template>
<div>
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
</div>
</template>

<script>
export default {
  name: 'ClassCourse',
  props: ['class_id'],
  data () {
    return {
      tableData: []
      // tableData: [{
      //   date: '上午',
      //   a: '英语',
      //   b: '英语',
      //   c: '英语',
      //   d: '英语',
      //   e: '英语'
      // }]
    }
  },
  mounted () {
    this.getCourse()
  },
  methods: {
    // 查询课程表数据的函数
    async getCourse () {
      // console.log(this.class_id)
      const { data: res } = await this.$axios.get('/admin/getSchedule/' + this.class_id)
      if (!res.success) {
        return this.$message.error('网络异常')
      }
      this.tableData = res.data
    }
  }
}
</script>

<style scoped>

</style>
