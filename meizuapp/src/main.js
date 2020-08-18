import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/vantUI.js' 
import './api'
import './filters/index.js'
import './assets/font/iconfont.css'
import './assets/index.css'
import 'axios'
import Mixins from './mixins'
Vue.use(Mixins)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
