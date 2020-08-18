import store from "../.."
import { Store } from "vuex"

const ez={
  state:{
    test:1
  },
  mutations:{
    sup(state){
      console.log(1)
      state.test++
    },
    sub(state){
      state.test--
    }
  }

}

export default  ez