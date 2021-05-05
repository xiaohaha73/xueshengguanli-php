<template>
  <el-card class="editTeach">
    <div class="submitFrom">
      <div class="form_box">
        <div class="title">更改任课教师</div>
        <div class="className">班级： {{ className }}</div>

        <el-form
          :inline="true"
          :model="editForm"
          :rules="rules"
          ref="editForm"
          label-width="100px"
        >
          <el-form-item label="语文老师" prop="yuwen">
            <el-select
              v-model="editForm.yuwen"
              placeholder="请选择语文老师"
              @focus="selectHandle(null,1)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>

          <el-form-item label="数学老师" prop="shuxue">
            <el-select
              v-model="editForm.shuxue"
              placeholder="请选择数学老师"
              @focus="selectHandle(null,2)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="英语老师" prop="yinyu">
            <el-select
              v-model="editForm.yinyu"
              placeholder="请选择英语老师"
              @focus="selectHandle(null,3)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>

          <el-form-item label="化学老师" prop="huaxue">
            <el-select
              v-model="editForm.huaxue"
              placeholder="请选择化学老师"
              @focus="selectHandle(null,4)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="物理老师" prop="wuli">
            <el-select
              v-model="editForm.wuli"
              placeholder="请选择物理老师"
              @focus="selectHandle(null,5)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="生物老师" prop="shengwu">
            <el-select
              v-model="editForm.shengwu"
              placeholder="请选择生物老师"
              @focus="selectHandle(null,6)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="历史老师" prop="lishi">
            <el-select
              v-model="editForm.lishi"
              placeholder="请选择历史老师"
              @focus="selectHandle(null,7)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="地理老师" prop="dili">
            <el-select
              v-model="editForm.dili"
              placeholder="请选择地理老师"
              @focus="selectHandle(null,8)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>
          <el-form-item
            label="政治老师"
            prop="zhengzhi"
          >
            <el-select
              v-model="editForm.zhengzhi"
              placeholder="请选择政治老师"
              @focus="selectHandle(null,9)"
            >
              <el-option
                v-for="(item,key) in teachersList"
                :key="key"
                :label="item.name"
                :value="item.account"
              />
            </el-select>
          </el-form-item>

          <el-form-item class="submitButton">
            <el-button type="primary" @click="submitForm()">提交更改</el-button>
            <el-button type="info" plain @click="cancelHandle">取消更改</el-button>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'editTeach',
  data () {
    return {
      // 班级信息
      className: '',
      // 请求过来的老师数据
      teachersList: [],
      // 整理好的老师信息
      teachersObj: [],
      editForm: {
        yuwen: '',
        shuxue: '',
        yinyu: '',
        huaxue: '',
        wuli: '',
        shengwu: '',
        lishi: '',
        dili: '',
        zhengzhi: ''
      },
      // 要提交的表单
      submitform: {
        classname: 0,
        account: []
      },
      rules: {
        yuwen: [
          { required: true, message: '请选择语文老师', trigger: 'blur' }
        ],
        shuxue: [
          { required: true, message: '请选择数学老师', trigger: 'blur' }
        ],

        yinyu: [
          { required: true, message: '请选择英语老师', trigger: 'change' }
        ],

        huaxue: [
          { required: true, message: '请选择化学老师', trigger: 'change' }
        ],

        wuli: [
          { required: true, message: '请选择物理老师', trigger: 'change' }
        ],

        shengwu: [
          { required: true, message: '请选择生物老师', trigger: 'change' }
        ],

        lishi: [
          { required: true, message: '请选择历史老师', trigger: 'change' }
        ],

        dili: [
          { required: true, message: '请选择地理老师', trigger: 'change' }
        ],

        zhengzhi: [
          { required: true, message: '请选择政治老师', trigger: 'change' }
        ]
      }
    }
  },
  mounted () {
    if (JSON.stringify(this.$route.params) === '{}') {
      return this.$router.push('/admin/options3')
    }
    const { classname, dili, huaxue, lishi, shengwu, shuxue, wuli, yinyu, yuwen, zhengzhi } = this.$route.params
    this.className = classname
    this.editForm =
      {
        yuwen: yuwen.name,
        shuxue: shuxue.name,
        yinyu: yinyu.name,
        huaxue: huaxue.name,
        shengwu: shengwu.name,
        wuli: wuli.name,
        lishi: lishi.name,
        dili: dili.name,
        zhengzhi: zhengzhi.name
      }
    this.formatTeacher(dili)
    this.formatTeacher(huaxue)
    this.formatTeacher(lishi)
    this.formatTeacher(shengwu)
    this.formatTeacher(shuxue)
    this.formatTeacher(wuli)
    this.formatTeacher(yinyu)
    this.formatTeacher(yuwen)
    this.formatTeacher(zhengzhi)
  },
  methods: {
    // 取消更改按钮
    cancelHandle () {
      this.$router.push('/admin/options3')
    },

    // 下拉框触发事件
    selectHandle (e, type) {
      // 先将teachersList清空
      this.teachersList = []
      switch (type) {
        case 1:
          this.getTeachers(1)
          break
        case 2:
          this.getTeachers(2)
          break
        case 3:
          this.getTeachers(3)
          break
        case 4:
          this.getTeachers(4)
          break
        case 5:
          this.getTeachers(5)
          break
        case 6:
          this.getTeachers(6)
          break
        case 7:
          this.getTeachers(7)
          break
        case 8:
          this.getTeachers(8)
          break
        case 9:
          this.getTeachers(9)
          break
      }
    },

    // 发送请求事件请求老师数据
    async getTeachers (num) {
      const { data: res } = await this.$axios.get('/admin/teachersList/' + num)
      if (!res.success) {
        return this.$message.error('网络异常!')
      }

      // 将数据保存到下拉框需要渲染的数据中去
      this.teachersList = res.list
    },

    // 表单提交函数
    submitForm () {
      this.$refs.editForm.validate(async (valid) => {
        if (!valid) {
          this.$message.error('提交数据有误！')
        }

        this.submitform.classname = Number(this.className.substr(0, 1))

        // 对提交的数据进行格式化
        const reg = /\d/
        for (const key in this.editForm) {
          if (!reg.test(this.editForm[key])) {
            // console.log(this.editForm[key])
            // 查找出他的account值
            this.teachersObj.forEach(item => {
              if (item.name === this.editForm[key]) {
                this.submitform.account.push(item.account)
              }
            })
          } else {
            this.submitform.account.push(this.editForm[key])
          }
        }

        // 提交表单
        // console.log(this.submitform)
        const { data: res } = await this.$axios.post('/admin/editTeach', {
          classname: this.submitform.classname,
          accounts: this.submitform.account
        })
        if (!res.success) {
          return this.$message.error('网络异常，请稍后重试')
        }
        this.$router.push('/admin/options3')
        return this.$message.success('修改成功！')
      })
    },

    // 格式化老师信息的函数
    formatTeacher (obj) {
      const teacher = {
        name: obj.name,
        account: obj.account
      }

      this.teachersObj.push(teacher)
    }

  }
}
</script>

<style scoped>

.editTeach {
  padding-top: 80px;
  padding-bottom: 100px;
  position: relative;
}

.editTeach .submitFrom .form_box .title {
  position: absolute;
  top: 50px;
  left: 50%;
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
  color: #409eff;
  font-weight: bold;
}

.editTeach .submitFrom .form_box .className {
  position: absolute;
  top: 100px;
  left: 46px;
  color: #001f3f;
  font-weight: bold;
}

.editTeach .submitFrom .form_box .el-form {
  margin-top: 80px;
  position: relative;
}

.editTeach .submitFrom .form_box .el-form .submitButton {
  position: absolute;
  bottom: -80px;
  left: 50%;
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
}
/*# sourceMappingURL=test.css.map */
</style>
