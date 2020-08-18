import axios from 'axios'

export default {
      getGoodsmo(params) {
        return axios.get('/api/getgoodsmo', params)
      },
      getComment(){
        return axios.get('/api/')
      }
}