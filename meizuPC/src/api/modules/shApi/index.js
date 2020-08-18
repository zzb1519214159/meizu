import axios from 'axios'

export default {
    getUser(params) {
        return axios.post('/reg', params)
    },
    getInfo(params) {
        return axios.post('/login', params)
    }
}