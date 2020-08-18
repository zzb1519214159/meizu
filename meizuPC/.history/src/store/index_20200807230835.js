import Vue from 'vue'
import Vuex from 'vuex'
import zbStore from './modules/zbStore'
import ezStore from './modules/ezStore'
import pjStore from './modules/pjStore'
import shStore from './modules/shStore'
import tnStore from './modules/tnStore'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    zbStore,
    ezStore,
    pqStore,
    shStore,
    tnStore
  }
})