<template>
  <div>
    <el-card>
      <el-row type="flex" align="middle" style="height:55px">
        <el-col :span="5" :offset="11">
          <span style="font-weight: bold;color: #409eff">任课教师信息</span>
        </el-col>
      </el-row>

      <el-row type="flex" justify="center" class="marginTop">
        <el-col>
          <el-table
            :data="tableData"
            border
            stripe
            :cell-style="{'text-align':'center'}"
            :header-cell-style="{'text-align':'center'}"
            style="width: 100%">
            <el-table-column
              prop="classname"
              label="班级"
            >
            </el-table-column>
              <el-table-column
                label="语文"
                prop="yuwen.name"
              >
              </el-table-column>
              <el-table-column
                prop="shuxue.name"
                label="数学">
              </el-table-column>
              <el-table-column
                prop="yinyu.name"
                label="英语">
              </el-table-column>
              <el-table-column
                prop="huaxue.name"
                label="化学">
              </el-table-column>
              <el-table-column
                prop="wuli.name"
                label="物理">
              </el-table-column>
              <el-table-column
                prop="shengwu.name"
                label="生物">
              </el-table-column>
              <el-table-column
                prop="lishi.name"
                label="历史">
              </el-table-column>
              <el-table-column
                prop="dili.name"
                label="地理">
              </el-table-column>
              <el-table-column
                prop="zhengzhi.name"
                label="政治">
              </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  type="primary"
                  size="mini"
                  @click="editHandle(scope.row)"
                >编辑</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>

<script>
export default {
  name: 'options3',
  mounted () {
    // 获取请求数据
    this.getDataList()
  },
  data () {
    return {
      tableData: []
    }
  },
  methods: {
    // 获取数据列表的函数
    async getDataList () {
      const { data: res } = await this.$axios.get('/admin/classTeachers')

      if (!res.success) {
        return this.$message.error('网络异常！')
      }
      this.tableData = res.data
    },

    editHandle (item) {
      // console.log(item)
      this.$router.push({
        name: 'editTeach',
        params: item
      })
    }
  }
}
</script>

<style scoped>

</style>
