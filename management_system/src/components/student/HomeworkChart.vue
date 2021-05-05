<template>
  <el-table
    :data="tableData"
    height="350"
    border
    style="width: 100%"
    :cell-style="{'text-align':'center'}"
    :header-cell-style="{'text-align':'center'}"
    :row-style="{'height':'60px'}"
  >
    <el-table-column
      prop="create_time"
      label="日期"
      width="180">
    </el-table-column>
    <el-table-column
      prop="homework"
      label="作业">
    </el-table-column>
  </el-table>
</template>

<script>
export default {
  name: 'HomeworkChart',
  props: {
    class_id: {
      type: Number,
      default: 1
    },
    course_id: {
      type: Number,
      default: 1
    }
  },
  data () {
    return {
      tableData: []
    }
  },
  mounted () {
    this.getData()
  },
  methods: {
    // 获取数据的函数
    async getData () {
      const url = '/admin/getHomeWork/' + this.class_id + '/' + this.course_id
      const { data: res } = await this.$axios.get(url)
      this.tableData = res.data
    }
  }
}
</script>

<style scoped>

</style>
