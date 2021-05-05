<template>
<div class="myContainer">
  <div class="title">布置作业</div>
  <el-card>
    <div class="courseName">{{className}}作业</div>
    <el-tabs v-model="activeName" type="card" style="margin-top: 25px">
      <el-tab-pane
        v-for="(item,index) in classList"
        :key="index"
        :label="item.class_id + '班'"
        :name="String(index)">
        <SubmitHomework :class_id="item.class_id" :course_id="item.id"/>
      </el-tab-pane>
    </el-tabs>
  </el-card>
  <FixedNav/>
</div>
</template>

<script>
import FixedNav from '@/components/teacher/FixedNav'
import SubmitHomework from '@/components/teacher/SubmitHomework'
export default {
  name: 'HomeWork',
  components: { SubmitHomework, FixedNav },
  mounted () {
    this.getClasses()
  },
  data () {
    return {
      activeName: '0',
      // 存储班级id值
      classList: [],
      // 课程名称
      className: ''
    }
  },
  methods: {
    // 获取当前老师所属的班级
    async getClasses () {
      const account = sessionStorage.getItem('account')
      const { data: res } = await this.$axios.get('/admin/getClassByAccount/' + account)

      if (!res.success) {
        return this.$message.error('网络异常')
      }
      this.classList = res.data
      this.className = res.data[0].name
    }
  }
}
</script>

<style scoped>
@import "~@/components/style/myContainer.css";
.courseName {
  margin: 15px auto;
  width: 200px;
  text-align: center;
  font-weight: bolder;
  font-size: 27px;
  color: #e6a23c
}
</style>
