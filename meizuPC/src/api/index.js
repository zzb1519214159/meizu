import axios from 'axios'
import Vue from 'vue'
import zbApi from './modules/zbApi'
import ezApi from './modules/ezApi'
import pjApi from './modules/pjApi'
import shApi from './modules/shApi'
import tnApi from './modules/tnApi'
// 配置根路径
axios.defaults.baseURL = 'http://127.0.0.1:3000'

Vue.prototype.Api = {
    zbApi,
    ezApi,
    pjApi,
    shApi,
    tnApi
}
