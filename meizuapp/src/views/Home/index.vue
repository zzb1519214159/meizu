<template>
  <div class="home">

    <!-- 轮播图区域 -->
   
    <van-swipe
      class="my-swipe"
      :autoplay="3000"
      indicator-color="white"
    >
      <van-swipe-item
        v-for="item in lunbolist"
        :key="item.id"
      >
        <img
          :src="item.img"
          alt=""
        
        >
      </van-swipe-item>
    </van-swipe>
     <van-notice-bar
  left-icon="shop-o"
  background="#f7f7f7"
  color="#999"
  scrollable
  text="魅族官方直供 * 满80免运费 * 7 天无理由退货"
/>
 <van-grid>
  <van-grid-item icon="/image/hot-site1.png" text="夏日福利" />
  <van-grid-item icon="/image/hot-site2.png" text="17 Pro" />
  <van-grid-item icon="/image/hot-site3.png" text="魅族 17" />
  <van-grid-item icon="/image/hot-site4.png" text="mCycle" />
</van-grid>
  <van-row class="index-banner">
  <van-col span="12"><van-image fit="fill" src="/image/banlg.jpg" /></van-col>
  <van-col span="12">
   <van-image fit="fill" src="/image/banrg1.jpg" />
    <van-image fit="fill" src="/image/banrg2.jpg" />
  </van-col>
  </van-row>
    <h3 class="title-main">智能手机</h3>
    <div class="main-img">
      <van-image  src="/image/mian.jpg" />
    </div>  
    <van-grid :border="false" :column-num="2" :gutter="5">
  <van-grid-item v-for="(good, index) in goodsmo" :key="index"  @click="goDetail('/home/goodsinfo',good.id)">
    <van-image :src="good.thumbnail_img" />
        <p class="promotion-title">{{good.title}}</p>
      <h2>￥{{good.sell_price}}</h2>
  </van-grid-item>
  
</van-grid>

  </div>
</template>
<script>

import axios  from 'axios'
export default {
  data: () => ({
    lunbolist: [],
    grids: [],
    active:"",
    goodsmo: []
  }),
  created() {
    this.getLunbo()
    this.getGoodsmo()
  },
  methods: {
    async getLunbo() {
      axios.get('')
      try {
        const { data: { message } } = await this.Api.getLunbo()
        this.lunbolist = message
      } catch (error) {
        this.$Toast('轮播图请求失败...')
    
      }
    },
   
      async getGoodsmo() {
      try {
        const { data: { message } } = await this.Api.getGoodsmo()

        this.goodsmo = message
      } catch (error) {
        this.$Toast('商品数据请求失败...')
      }
    }
  },
 
 
}
</script>
<style lang="less">
.home {
  padding-bottom: 40px;
  .van-grid{
 background: #f4f4f4 !important;
  }
 
  .van-grid-item{
    width: 50%;
    .van-grid-item__content{
      background: #fff !important;
    }
     .promotion-title{
         font-size: 14px;
         color: #333;
         padding: 0 20px;
         height: 16px;
         text-align: center;
         line-height: 16px;
         font-weight: 700;
         text-overflow: ellipsis;
         white-space: nowrap;
         overflow: hidden;
         box-sizing:border-box;
         width: 100%;
    }
    h2{
      font-size: 13px;
          color: #c00;
          font-weight: normal;

    }
  }
 
  .promotion{
    color: #c00;
    display: flex;
    justify-content: center;
    align-items: center;
    
    span{
        padding:2px;
        font-size: 12px;
        border: 1px solid #c00;
    }
  }
  background: #f4f4f4;
  .van-swipe-item{
    height: initial !important;
  }
  .my-swipe {
    img {
      width: 100%;
      height: 100%;
    }
  }
  .van-grid-item__icon {
    font-size: 60px;
  }

 .van-grid{
   background: #fff;
   margin-bottom: 5px;
 }
.index-banner{
  .van-image{
   display: block;
  }
}
.title-main{
  text-align: center;
  margin: 0;
  padding:35px 0 25px;
}
}
</style>
