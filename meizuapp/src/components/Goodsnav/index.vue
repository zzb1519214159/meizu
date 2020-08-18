<template>
  <div class="goodsnav">

    <van-nav-bar
      fixed
      placeholder
      @click-left="onClickLeft"
      @click-right="onClickRight"
    >
      <template #left>
        <van-icon
          name="arrow-left"
          size="18"
          color="#333"
        />
      </template>
      <template #right>
        <van-icon
          name="wap-home-o"
          size="18"
          color="#333"
        />
      </template>
    </van-nav-bar>
  </div>
</template>
<script>

import { Toast } from 'vant';
export default {
  data: () => ({
    
  }),
  created () {
  
  },
  methods: {
      onClickLeft() {
      Toast('返回')
     this.$router.go(-1)
    },
    onClickRight(){
     this.$router.push('/home')
    },
      

   }
   
 }

</script>
<style lang="less" >

.goodsnav{
    .van-nav-bar{
     background: transparent !important;
    }
}
</style>
