<template>
  <div class="myContainer">
    <div class="title">个人成绩</div>
    <el-card style="padding: 70px 60px 100px 60px">
      <el-table
        :data="tableData"
        border
        style="width: 100%"
        :cell-style="{'text-align':'center'}"
        :header-cell-style="{'text-align':'center'}"
        :row-style="{'height':'60px'}"
        class="tb-edit"
        highlight-current-row
      >
        <el-table-column
          prop="name"
          label="姓名"
          width="110">
        </el-table-column>
        <el-table-column
          prop="a"
          label="语文"
          >
        </el-table-column>
        <el-table-column
          prop="b"
          label="数学">
        </el-table-column>
        <el-table-column
          prop="c"
          label="英语">
        </el-table-column>
        <el-table-column
          prop="d"
          label="化学">
        </el-table-column>
        <el-table-column
          prop="e"
          label="物理">
        </el-table-column>
        <el-table-column
          prop="f"
          label="生物">
        </el-table-column>
        <el-table-column
          prop="g"
          label="历史">
        </el-table-column>
        <el-table-column
          prop="h"
          label="地理">
        </el-table-column>
        <el-table-column
          prop="i"
          label="政治">
        </el-table-column>
      </el-table>
    </el-card>
    <FixedNav/>
  </div>
</template>

<script>
import FixedNav from '@/components/student/FixedNav'
export default {
  name: 'GradeForm',
  components: { FixedNav },
  mounted () {
    this.getData()
  },
  data () {
    return {
      tableData: []
    }
  },
  methods: {
    // 获取数据
    async getData () {
      const account = sessionStorage.getItem('account')
      const { data: res } = await this.$axios.get('/admin/getStudentGrade/' + account)

      if (!res.success) {
        return this.$message.error('网络异常')
      }

      this.tableData.push(res.data)
    }
  }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
</style>
