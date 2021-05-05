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
      prop="name"
      label="姓名"
      width="180">
    </el-table-column>
    <el-table-column
      prop="a"
      label="语文"
      width="180">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.a }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.a"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="b"
      label="数学">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.b }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.b"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="c"
      label="英语">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.c }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.c"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="d"
      label="化学">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.d }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.d"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="e"
      label="物理">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.e }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.e"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="f"
      label="生物">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.f }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.f"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="g"
      label="历史">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.g }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.g"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="h"
      label="地理">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.h }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.h"
            @change="changeHandle(scope.$index, scope.row)"
          />
        </div>
      </template>
    </el-table-column>
    <el-table-column
      prop="i"
      label="政治">
      <template slot-scope="scope">
        <div class="tableCell">
          <span style="font-weight: bold">{{ scope.row.i }}</span>
          <el-input
            placeholder="输入分数"
            v-model="scope.row.i"
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
  name: 'GradeChart',
  props: {
    classid: {
      type: Number,
      default: 1
    }
  },
  mounted () {
    // 根据班级id查询本班的学生成绩
    this.getData()
  },
  data () {
    return {
      tableData: []
    }
  },
  methods: {
    // 获取学生成绩的函数
    async getData () {
      const { data: res } = await this.$axios.get('/admin/getGrade/' + this.classid)
      if (!res.success) {
        return this.$message.error('网络异常请稍后重试')
      }

      this.tableData = res.data
    },
    async changeHandle (index, row) {
      // console.log(index, row)
      const { account, a, b, c, d, e, f, g, h, i } = row
      const { data: res } = await this.$axios.post('/admin/editGrade', {
        account, a, b, c, d, e, f, g, h, i
      })

      if (!res.success) {
        return this.$message.error('更新失败')
      }

      return this.$message.success('更新成功')
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
