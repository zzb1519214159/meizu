import Vue from 'vue'
import VueRouter from 'vue-router'
import zbRoutes from './modules/zbRoutes'
import ezRoutes from './modules/ezRoutes'
import pjRoutes from './modules/pjRoutes'
import shRoutes from './modules/shRoutes'
import tnRoutes from './modules/tnRoutes'

Vue.use(VueRouter)

const routes = [
  ...zbRoutes,
  ...ezRoutes,
  ...pjRoutes,
  ...shRoutes,
  ...tnRoutes

]

const router = new VueRouter({
  routes
})

const routerPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error=> error)
}
export default router
