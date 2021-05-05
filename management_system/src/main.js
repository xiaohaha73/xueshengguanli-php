import Vue from 'vue'
import App from './App.vue'

// 导入组件库
import ElementUI from 'element-ui'
// 导入组件相关样式
import 'element-ui/lib/theme-chalk/index.css'

// 配置axios
import axios from 'axios'

import router from './router'
import store from './store'
import './plugins/element.js'

// 配置 Vue 插件
Vue.use(ElementUI)

Vue.prototype.$axios = axios
Vue.config.productionTip = false

// 配置公共请求头
axios.defaults.baseURL = '/api'
// 配置公共的post的Content - Type
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
