<template>
  <div class="app">


  <Homenav></Homenav>
    <!-- 路由区域 -->
    <router-view />

    <!-- 底部导航区域 -->
    <!-- <van-tabbar v-model="active"   placeholder
  fixed>
      <van-tabbar-item
        icon="home-o"
        to="/home"
      >home</van-tabbar-item>
      <van-tabbar-item
        icon="friends-o"
        to="/frients"
      >friends</van-tabbar-item>

      <van-tabbar-item
        icon="cart-o"
        to="/cart"
        badge="6"
      >cart</van-tabbar-item>
      <van-tabbar-item
        icon="search"
        to="/search"
      >search</van-tabbar-item>
    </van-tabbar> -->
    <Footer></Footer>
  </div>
</template>
<script>
import Homenav from './components/Homenav/index.vue'
import Footer from './components/Footer/index.vue'
import { Toast } from 'vant';
export default {
  data: () => ({
    active: 0,

  }),
  created() {

  },
  methods: {
    // onClickLeft() {
    //   Toast('返回');
    //  this.$router.go(-1)
    // },
     
  },

   components:{
    Homenav,
    Footer
  }
}

</script>
<style lang="less" scoped>


</style>
