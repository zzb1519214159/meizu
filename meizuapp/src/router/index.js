import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../views/Home'
import Frients from '../views/Frients'
import Cart from '../views/Cart'
import Search from '../views/Search'
import Register from '../views/Register'
import Login from '../views/Login'
import GoodsInfo from '../views/Home/Goods/GoodsInfo/index.vue'
import GoodsList from '../views/Home/Goods/GoodsList/index.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/home',
  },
  {
    path: '/home',
    component: Home,
  },
  {
    path: '/frients',
    component: Frients
  },
  {
    path: '/cart',
    component: Cart,
    meta: {
      isshow: true,
      fot:true
   }
  },
  {
    path: '/search',
    component: Search
  },
  {
    path: '/login',
    component: Login,
    meta: {
      isshow: true,
      fot:true
   }
  },
  {
    path: '/register',
    component: Register,
    meta: {
      isshow: true,
      fot:true
   }
  },
  {
    path: '/home/goodslist/:id',
    component: GoodsList,
  },
  {
    path: '/home/goodsinfo/:id',
    component: GoodsInfo,
    meta: {
      isshow: true,
   }
  }
  
]

const router = new VueRouter({
  routes
})


export default router
