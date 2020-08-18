import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './api'
import './plugins/element.js'
import './assets/index.css'
import '../public/font/iconfont.css'
import 'axios'
import Mixins from './mixin/index.js'
Vue.use(Mixins)
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
