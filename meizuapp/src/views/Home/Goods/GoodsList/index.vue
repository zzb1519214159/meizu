<template>
<div class="goodslist">
    <div class="product-banner banner1" v-show="this.$route.params.id == 1">
      <img src="/image/goodsinfo/1.jpg" alt="">
    </div>
    <div class="product-banner banner2" v-show="this.$route.params.id == 2">
      <img src="/image/goodsinfo/2.jpg" alt="">
    </div>
    <div class="product-banner banner3" v-show="this.$route.params.id == 3">
     <img src="/image/goodsinfo/3.jpg" alt="">
    </div>
    <div class="product-banner banner3" v-show="this.$route.params.id == 4">
      <img src="/image/goodsinfo/4.jpg" alt="">
    </div>
    <ul class="godlist">
        <li v-for="(item, index) in goodsList" :key="index"  @click="goDetail('/home/goodsinfo',item.id)">
            <img :src="item.thumbnail_img" alt="">
            <h3>魅族 17 Pro</h3>
            <p>【限时领券至高立省200】【购17Pro赠全新壳膜套装】【老用户专享 18个月超长保修】【学生购机享精美礼品】高通骁龙 865 + UFS 3.1 + LPDDR5 | 6400W 全场景 AR 专业影像系统 </p>
            <span>￥4299</span>
        </li>
    </ul>
</div>
</template>
<script>
import axios  from 'axios'
export default {
  data: () => ({
    goodsList:[]
  }),
  created () {
       var id = this.$route.params.id
    this.getGoodsmo(id)
  },
   updated(){
    // console.log(this.$route.params.id)
     var id = this.$route.params.id
     this.getGoodsmo(id)
  },
  methods: {
  async getGoodsmo(id){
        try {
        const { data: { message } } = await this.Api.getGoodsmo()
        const arr=[]
        message.forEach(el =>{
          if(el.classify == id){
            arr.push(el)
          }
        })
          this.goodsList = arr
   
      } catch (error) {
       alert('商品数据请求失败...')
      }
    }

  },
 
};
</script>
<style lang="less">
.goodslist{

  .product-banner{
    width: 100%;
    height: auto;
    img{
      width: 100%;
      height: 100%;
    }
  }
  .godlist{
    display: flex;
    justify-content: space-between;
    background: #f4f4f4;
    flex-wrap: wrap;
    li{
      width: 49.5%;
      height: 232px;
      padding-top: 15px;
      padding-bottom: 9px;
      display: flex;
      flex-direction: column;
      align-items: center;
      background: #fff;
      margin-top: 5px;
      img{
        width: 85%;
      }
      h3{
        font-size: 12px;
        color: #000;
        font-weight: 100;
      }
      p{
    font-size: 12px;
    color: #999;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    height:22px;
    margin: 0;
     width: 100%;
    display: block;
    padding: 5px 5px;
    line-height: 12px;
    box-sizing:border-box;
      }
      span{
        color: #c00;
        font-size: 12px;
      }
    }
  }
}
</style>