import axios from 'axios'
import Vue from 'vue'
// 配置根路径
axios.defaults.baseURL = 'http://10.41.152.83:3000'

Vue.prototype.Api = {
  // 获取轮播数据
  getLunbo(params) {
    return axios.get('/api/getlunbo', params)
  },
  getGoodsmo(params) {
    return axios.get('/api/getgoodsmo', params)
  },
  getGoodsInfoById(params){
    return axios.get('/api/getgoodsmo/'+params)
  },
  //获取购物车信息
  getcartgoods(params){
    return axios.get('/api/getcartgoods/'+params)
  },
  //删除购物车信息
  deletegoods(params){
    return axios.post('/api/deletegoods',params)
  },
   getUser(params) {
        return axios.post('/reg', params)
    },
    getInfo(params) {
        return axios.post('/login', params)
    }

}
