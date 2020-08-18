import Vue from 'vue'
import VueRouter from 'vue-router'
import zbRoutes from './modules/zbRoutes'
import ezRoutes from './modules/ezRoutes'
import pjRoutes from './modules/pqRoutes'
import shRoutes from './modules/shRoutes'
import tnRoutes from './modules/tnRoutes'

Vue.use(VueRouter)

const routes = [
  ...zbRoutes,
  ...ezRoutes,
  ...pqRoutes,
  ...shRoutes,
  ...tnRoutes

]

const router = new VueRouter({
  routes
})

export default router
