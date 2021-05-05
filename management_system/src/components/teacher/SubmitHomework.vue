<template>
  <div class="homework" id="homework">
    <div class="homeworkList">
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
    </div>
    <div class="addHomework">
      <el-form :model="submitForm" :rules="rules" ref="submitForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="课后作业：" prop="homework">
          <el-input
            type="textarea"
            :rows="10"
            v-model="submitForm.homework"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitHandle('submitForm')">立即创建</el-button>
          <el-button @click="resetForm('submitForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SubmitHomework',
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
      tableData: [],
      submitForm: {
        homework: '',
        class_id: 0,
        course_id: 0
      },
      rules: {
        homework: [
          { required: true, message: '请填写布置的作业内容', trigger: 'blur' }
        ]
      }
    }
  },
  mounted () {
    // 获取数据
    this.getData()
  },
  methods: {
    // 获取数据的函数
    async getData () {
      const url = '/admin/getHomeWork/' + this.class_id + '/' + this.course_id
      const { data: res } = await this.$axios.get(url)
      this.tableData = res.data
    },
    submitHandle (formName) {
      this.$refs[formName].validate(async (valid) => {
        if (!valid) {
          return this.$message.error('数据不能为空')
        }

        this.submitForm.class_id = this.class_id
        this.submitForm.course_id = this.course_id
        // 提交数据
        const { data: res } = await this.$axios.post('/admin//addHomework', { ...this.submitForm })
        if (!res.success) {
          return this.$message.error('网络异常请稍后重试')
        }
        this.getData()
        return this.$message.success('提交成功')
      })
    },
    resetForm (formName) {
      this.$refs[formName].resetFields()
    }
  }
}
</script>

<style scoped>
.homework {
  width: 100%;
  height: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -ms-flex-direction: row;
  flex-direction: row;
}

.homework .homeworkList {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
}

.homework .addHomework {
  -webkit-box-flex: 1;
  -ms-flex: 1;
  flex: 1;
  padding: 60px 20px 20px 20px;
}
/*# sourceMappingURL=test.css.map */
</style>
