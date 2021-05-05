<template>
  <div>
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
        prop="date"
        label="时间"
        width="180">
      </el-table-column>
      <el-table-column
        prop="a"
        label="星期一"
        width="180">
        <template slot-scope="scope">
          <div class="tableCell">
            <span style="font-weight: bold">{{ scope.row.a }}</span>
            <el-input
              placeholder="输入课程名"
              v-model="scope.row.a"
              @change="changeHandle(scope.$index, scope.row)"
            />
          </div>
        </template>
      </el-table-column>
      <el-table-column
        prop="b"
        label="星期二">
        <template slot-scope="scope">
          <div class="tableCell">
            <span style="font-weight: bold">{{ scope.row.b }}</span>
            <el-input
              placeholder="输入课程名"
              v-model="scope.row.b"
              @change="changeHandle(scope.$index, scope.row)"
            />
          </div>
        </template>
      </el-table-column>
      <el-table-column
        prop="c"
        label="星期三">
        <template slot-scope="scope">
          <div class="tableCell">
            <span style="font-weight: bold">{{ scope.row.c }}</span>
            <el-input
              placeholder="输入课程名"
              v-model="scope.row.c"
              @change="changeHandle(scope.$index, scope.row)"
            />
          </div>
        </template>
      </el-table-column>
      <el-table-column
        prop="d"
        label="星期四">
        <template slot-scope="scope">
          <div class="tableCell">
            <span style="font-weight: bold">{{ scope.row.d }}</span>
            <el-input
              placeholder="输入课程名"
              v-model="scope.row.d"
              @change="changeHandle(scope.$index, scope.row)"
            />
          </div>
        </template>
      </el-table-column>
      <el-table-column
        prop="e"
        label="星期五">
        <template slot-scope="scope">
          <div class="tableCell">
            <span style="font-weight: bold">{{ scope.row.e }}</span>
            <el-input
              placeholder="输入课程名"
              v-model="scope.row.e"
              @change="changeHandle(scope.$index, scope.row)"
            />
          </div>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: 'CourseChart',
  props: {
    // 接收传递过来的班级id值
    classid: {
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
    // console.log(this.classid)
    this.getData()
  },
  methods: {
    // 请求数据的函数
    async getData () {
      const { data: res } = await this.$axios.get('/admin/getSchedule/' + this.classid)
      if (!res.success) {
        return this.$message.error('数据异常，请稍后重试')
      }

      this.tableData = res.data
    },
    async changeHandle (index, row) {
      // console.log(index, row)
      // 判断数据是否为空
      let flag = true
      for (const key in row) {
        if (row[key] === '') {
          this.$message.error('课程名不能为空')
          flag = false
          break
        }
      }

      if (!flag) {
        // 数据有空字段禁止提交
        return false
      }

      // 发送请求更改数据
      const { data: res } = await this.$axios.post('/admin/editSchedule', {
        row: index,
        classid: this.classid,
        a: row.a,
        b: row.b,
        c: row.c,
        d: row.d,
        e: row.e
      })

      if (!res.success) {
        return this.$message.error('更改失败,请稍后重试')
      }

      return this.$message.success('更改成功')
    }
  }
}
</script>

<style scoped>
.tb-edit .el-button {
  display: none
}

.tb-edit .el-input {
  display: none
}

.tb-edit .current-row .el-button {
  display: block
}

.tb-edit .current-row .el-input {
  display: block
}

.tb-edit .current-row span {
  display: none
}

.tableCell {
  display: flex;
  text-align: center;
  flex-direction: row;
}
.tableCell span {
  display: block;
  width: 70px;
  height: 30px;
  margin: 0 auto;
  box-sizing: border-box;
  padding-top: 5px;
}

.el-button--mini.is-circle {
  padding: 12px;
}

</style>
