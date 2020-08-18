// const mixin = {

// }
// export default mixin

export default {
  install(Vue) {
    Vue.mixin({
      methods: {
        goDetail(url, id) {
          this.$router.push(url + '/' + id)
        }
      }
    })
  }
}
