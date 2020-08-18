import axios from 'axios'
// const getGoodsInfoById=params=>{
//   return axios.get('/api/getgoodmo/'+params)
// }
export default{
  //根据id获取商品详情
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
  }
}
// export default getGoodsInfoById=params=>{
//   return axios.get('/api/getgoodmo/'+params)
// }