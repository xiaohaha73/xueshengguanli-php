<template>
<div>
  <el-card>
    <el-row type="flex" align="middle" style="height:55px">
      <el-col :span="5" :offset="11">
        <span style="font-weight: bold;color: #409eff">教师信息</span>
      </el-col>
    </el-row>
    <el-row type="flex">
      <el-col :span="5">
        <el-button
          type="primary"
          @click="addTeacherHandle"
        >添加老师</el-button>
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
          <el-table-column prop="account" label="工号"></el-table-column>
          <el-table-column prop="name" label="姓名"></el-table-column>
          <el-table-column prop="sex" label="性别" width="90px"></el-table-column>
          <el-table-column prop="courseid" label="教授课程"></el-table-column>
          <el-table-column label="操作">
            <template slot-scope="scope">
              <el-button @click="editClick(scope.row)" size="small" type="primary">编辑</el-button>
              <el-button size="small" type="danger" @click="deleteHandle(scope.row)">删除</el-button>
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
          :total="total">
        </el-pagination>
      </el-col>
    </el-row>

  </el-card>
</div>
</template>

<script>
export default {
  name: 'options2.vue',
  mounted () {
    // 初始化加载数据
    this.getData()
  },
  data () {
    return {
      // 表格数据
      listData: [],
      // 当前显示的页
      currentPage: 1,
      // 每页显示的条数
      size: 4,
      // 数据总条数
      total: 0

    }
  },
  methods: {
    // 加载数据的函数
    async getData (page = 1, size = 4) {
      const { data: res } = await this.$axios.get('/admin/getTeachers/' + page + '/' + size)
      if (!res.success) {
        return this.$message.error('网络异常，请稍后重试！')
      }

      const course = ['语文', '数学', '英语', '化学', '物理', '生物', '历史', '地理', '政治']
      res.data.forEach((item) => {
        item.sex = item.sex ? '男' : '女'
        item.courseid = course[item.courseid - 1]
      })

      this.listData = res.data
      this.total = res.total
    },

    // 添加老师的函数
    addTeacherHandle () {
      this.$router.push('/admin/addteacher')
    },

    // 编辑函数
    editClick (item) {
      // console.log(item)
      this.$router.push({
        path: '/admin/editteacher',
        query: { account: item.account }
      })
    },

    // 删除函数
    deleteHandle (item) {
      const account = item.account
      this.$confirm('确认删除该老师吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        // 确认删除操作
        // 调用删除接口
        const { data: res } = await this.$axios.get('/admin/deleteTeacher/' + account)
        if (!res.success) {
          return this.$message.error('网络错误请稍后重试')
        }
        // 删除成功
        this.$message.success('删除成功!')
        this.getData()
      }).catch(() => {
        // 取消删除
        this.$message.info('已取消删除!')
      })
    },

    // 每页显示数据条数函数
    handleSizeChange (size) {
      this.size = size
      this.getData(this.currentPage, size)
    },

    // 选中页数函数
    handleCurrentChange (page) {
      this.currentPage = page
      this.getData(page, this.size)
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
