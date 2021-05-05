<template>
  <div>
    <el-card>
      <el-row type="flex" align="middle" style="height:55px">
        <el-col :span="5" :offset="11">
          <span style="color: #409eff;text-align: center;font-weight: bold">学生信息</span>
        </el-col>
      </el-row>
      <el-row type="flex">
        <el-col :span="5">
          <el-button
            type="primary"
            @click="addStudentHandle"
          >添加学生</el-button>
        </el-col>
      </el-row>
      <el-row type="flex" justify="center" class="marginTop">
        <el-col>
          <el-table
            border
            :data="listData"
            stripe
            :cell-style="{'text-align':'center'}"
            :header-cell-style="{'text-align':'center'}"
            :row-style="{'height':'50px'}"
          >
            <el-table-column prop="account" label="学号"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="sex" label="性别" width="90px"></el-table-column>
            <el-table-column prop="classid" label="班级" width="90px"></el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button @click="editClick(scope.row)" size="small" type="primary">编辑</el-button>
                <el-button @click="deleteHandle(scope.row)" size="small" type="danger">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-col>
      </el-row>
      <!--  分页  -->
      <el-row class="marginTop">
        <el-col>
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="currentPage"
            :page-sizes="[4, 6, 8,10]"
            :page-size="size"
            layout="total, sizes, prev, pager, next, jumper"
            :total=total>
          </el-pagination>
        </el-col>
      </el-row>

    </el-card>
  </div>
</template>

<script>
export default {
  name: 'options1',
  mounted () {
    // 请求学生数据
    this.getStudents()
  },
  data () {
    return {
      // 表格数据
      listData: [],
      // 数据总条数
      total: 0,

      // 当前显示的页
      currentPage: 1,

      // 每一页显示的条数
      size: 4

    }
  },
  methods: {
    // 请求数据函数
    async getStudents (page = 1, size = 4) {
      const { data: res } = await this.$axios.get('/admin/getStudents/' + page + '/' + size)
      if (!res.success) {
        // 请求失败
        this.$message.error('网络异常!')
      }

      // 请求成功
      res.data.forEach((items) => { // 转换一下性别显示成文字
        items.sex = items.sex ? '男' : '女'
      })
      this.total = res.total
      this.listData = res.data
    },
    // 跳转添加数据页面的函数
    addStudentHandle () {
      this.$router.push('/admin/addstudent')
    },
    // 编辑函数
    editClick (item) {
      // console.log(item.account)
      // 跳转到编辑页面
      this.$router.push({
        path: '/admin/editstudent',
        query: { account: item.account }
      })
    },

    // 删除学生函数
    deleteHandle (item) {
      const account = item.account
      this.$confirm('确认删除该学生吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        // 确认删除操作
        // 调用删除接口
        const { data: res } = await this.$axios.get('/admin/deleteStudent/' + account)
        if (!res.success) {
          return this.$message.error('网络错误请稍后重试')
        }
        // 删除成功
        this.$message.success('删除成功!')
        this.getStudents()
      }).catch(() => {
        // 取消删除
        this.$message.info('已取消删除!')
      })
    },

    // 每页显示数据条数函数
    handleSizeChange (size) {
      // console.log(size)
      // 重新调用请求数据的函数
      this.getStudents(this.currentPage, size)
      this.size = size
    },

    // 选中页数函数
    handleCurrentChange (page) {
      // console.log(page)
      this.getStudents(page, this.size)
    }
  }
}
</script>

<style scoped>
/*每行的间距样式*/
.marginTop {
  margin-top: 15px;
}
</style>
