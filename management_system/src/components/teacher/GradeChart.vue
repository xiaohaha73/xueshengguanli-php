<template>
  <div class="chart">
    <el-table
      :data="tableData"
      border
      style="width: 100%"
      :cell-style="{'text-align':'center'}"
      :header-cell-style="{'text-align':'center'}"
    >
      <el-table-column
        prop="name"
        label="姓名"
      >
      </el-table-column>
      <el-table-column
        prop="score"
        label="分数"
      >
      </el-table-column>
      <el-table-column
        label="修改"
      >
        <template slot-scope="scope">
          <el-button
            size='mini'
            type="primary"
            @click="editScoreHandle(scope.row)"
          >修改</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 修改成绩弹窗 -->
    <el-dialog
      title="修改成绩"
      :visible.sync="dialogVisible"
      width="30%"
      :before-close="handleClose"
      class="dialog"
    >
      <el-input
        v-model="editInfo.score"
        style="width: 150px"
      ></el-input> 分
      <span slot="footer" class="dialog-footer">
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="submitHandle">确 定</el-button>
  </span>
    </el-dialog>

    <el-pagination
      background
      layout="prev, pager, next"
      :page-size="5"
      :total="100"
      style="margin-top: 30px"
    >
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: 'GradeChart',
  props: {
    class_id: { // 传递过来的班级id
      type: Number,
      default: 1
    },
    course_id: {
      type: Number, // 传递过来的课程id值
      default: 1
    }
  },
  mounted () {
    // 获取这个班的成绩
    this.getScore()
  },
  data () {
    return {
      // 课程索引值,
      objMap: {
        1: 'a',
        2: 'b',
        3: 'c',
        4: 'd',
        5: 'e',
        6: 'f',
        7: 'g',
        8: 'h',
        9: 'i'
      },
      scoreName: '',
      tableData: [], // 查询到的成绩数据
      dialogVisible: false, // 修改成绩弹窗的打开
      editInfo: {} // 需要修改的信息
    }
  },
  methods: {
    // 根据班级id获取这个班学生的成绩
    async getScore () {
      const { data: res } = await this.$axios.get('/admin/getGrade/' + this.class_id)
      if (!res.success) {
        return this.$message.error('网络异常请稍后重试')
      }
      this.scoreName = this.objMap[this.course_id]
      res.data.forEach(item => {
        const number = {
          name: '',
          score: 0,
          courseid: '',
          account: ''
        }

        number.name = item.name
        number.score = item[this.scoreName]
        number.courseid = this.scoreName
        number.account = item.account
        this.tableData.push(number)
      })
    },

    // 修改成绩函数
    editScoreHandle (item) {
      this.editInfo = item
      this.dialogVisible = true
    },

    // 弹窗关闭函数
    handleClose (done) {
      done()
    },

    // 提交更改信息的函数
    async submitHandle () {
      const { courseid, account, score } = this.editInfo
      const { data: res } = await this.$axios.post('/admin/editScore', {
        courseid,
        account,
        score
      })

      if (!res.success) {
        return this.$message.error('更改失败')
      }

      this.dialogVisible = false
      return this.$message.success('更新成功')
    }

  }
}
</script>

<style scoped>
.dialog {
  margin-top: 25vh !important;
}
</style>
