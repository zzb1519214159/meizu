<template>
  <div class="goodsinfo">
    <Goodsnav></Goodsnav>
    <van-swipe :autoplay="3000">
      <van-swipe-item
        v-for="image in 4"
        :key="image"
        class="tab-info"
      >
        <img
          :src="goodsinfo.img_url+'slider/'+image+'.jpg'"
          alt=""
        >
      </van-swipe-item>
    </van-swipe>
    <div class="info-title">
      <h3>{{goodsinfo.title}}</h3>
      <span>¥ {{goodsinfo.sell_price}}</span>
      <h4>{{goodsinfo.coupon}}</h4>
      <p>{{goodsinfo.subtitle}}</p>
    </div>
    <div class="info-service">
      <div>
        <p>花呗分期</p>
        <p>顺丰发货</p>
      </div>
      <p>7天无理由退货（具体查看详情）</p>
    </div>
    <div class="pting" >
      <van-button
        block
        @click="show = true"
      >选择商品信息
      </van-button>
    </div>

    <!-- 图片详情 -->
    <div class="info-mion">
      <h2>图片详情</h2>
      <div
        v-for="item in 8"
        :key="item.index"
      >
        <img
          :src="goodsinfo.img_url+'pro_center/'+item+'.jpg'"
          alt=""
        >
      </div>
    </div>
    <van-sku
      v-model="show"
      :sku="sku"
      :goods="goods"
      :goods-id="goodsId"

      :hide-stock="sku.hide_stock"
      @buy-clicked="onBuyClicked"
      @add-cart="onAddCartClicked"
    />
    <van-goods-action>
      <van-goods-action-icon
        icon="chat-o"
        text="客服"
      />
      <van-goods-action-icon
        icon="star-o"
        text="收藏"
      />
      <van-goods-action-icon
        icon="cart-o"
        text="购物车"
        badge="0"
      />
      <van-goods-action-button
        type="warning"
        text="加入购物车"
         @click="addgoods"
      />
      <van-goods-action-button
        type="danger"
        text="立即购买"
      />
    </van-goods-action>
  </div>
</template>
<script>
import axios from 'axios'
import Goodsnav from "../../../../components/Goodsnav/index.vue";
export default {
  data: () => ({
    goodsinfo: [],
    id: "",
    show: false,
    sku: {
      tree: [
          {
          k: '颜色:默认',
          v: [
        
          ],
          k_s: 's1',
          count: 2
        }
      ],
     
      list: [
        
      ],
      price: '',
      stock_num: 60, 
    },
    goodsId: '',
    goods: {
      title: '',
      picture:''
 
    },
     style: [],
    radio: "",
    //颜色
    color: [],
    size: ["8+128GB", "8+256GB"],
    radio4: "官方标配",
    meal: ["官方标配", "EP3C套餐", "碎屏保套餐", "充电套餐"],
    //数量
    num: 1,
  
  }),
  created() {
    this.id = this.$route.params.id;
    this.getGoodsInfoById();
  },
  methods: {
    onBuyClicked(){
      
    },
    onAddCartClicked(){
      
    },
    async getGoodsInfoById() {
      console.log("第" + this.id + "个商品");
      try {
        const {
          data: { message },
        } = await this.Api.getGoodsInfoById(this.id);
        this.goodsinfo = message;
        this.style = JSON.parse(message.model);
        this.color = JSON.parse(message.Color);
        this.sku.price = JSON.parse(message.sell_price)
        this.goods.title = message.title
        this.goodsId = message.id
        this.goods.picture = `http://127.0.0.1:3000${message.thumbnail_img}`
        // console.log(this.goodsinfo.img_url + "slider/1.jpg");
        console.log(this.goodsinfo);
        // this.$Toast("请求成功")
      } catch (error) {
        // this.$Toast('图片详情请求失败'+error.message)
        console.log("商品详情请求失败" + error.message);
      }
    },
    //加入购物车
    async addgoods(){
      if(!localStorage.getItem('userInfo')){
        alert("请先登录账户")
        setTimeout(()=>{
           this.$router.push('/login')
        },2000)
        return
      }
      let num = document.getElementsByClassName('van-stepper__input');
      const Params={
        uId:JSON.parse(localStorage.getItem('userInfo')).uId,//模拟用户id
        gId:this.id,//商品id
        gName:this.goodsinfo.title,
        gPrice:this.goodsinfo.sell_price,
        gNumber:this.num,
        gImg:this.goodsinfo.thumbnail_img,
        gTotal:this.goodsinfo.sell_price*this.num,
        gDesc:'全网通公开版AG星际灰8+128GB'
      }
      
      // console.log(Params)
      // console.log(this.goodsinfo.sell_price)
      //发送ajax请求
      const {data:{err_code,message}}=await axios.post('/api/addgoods',Params)
      alert('加入购物车成功')
      this.getcartgoods()
    },
     async getcartgoods() {
      //默认是没有登录的,判断有没有token,
      //没有就是this.isLogin=false
      //如果有token就把this.isLogin改为ture
      console.log(JSON.parse(localStorage.getItem('userInfo')))
      if(localStorage.getItem('userInfo')){
        let nid = JSON.parse(localStorage.getItem('userInfo')).uId
        this.username = JSON.parse(localStorage.getItem('userInfo')).name
        console.log(this.username);
        try {
        const {
          data: { message },
        } = await this.Api.getcartgoods(nid);//uid写死
        console.log(message)
        this.$store.state.pjStore.cartsList= message;
        // this.$Toast("请求成功")
      } catch (error) {
        // this.$Toast('图片详情请求失败'+error.message)
        console.log("商品详情请求失败" + error.message);
      }
      }
      
    },
  },

  mounted(){
    window.scrollTo(0,0)
  },
  components: {
    Goodsnav,
  },
};
</script>
<style lang="less">
.van-nav-bar__placeholder {
  background: #fff;
}
.goodsinfo {
  background: #f4f4f4;
  .tab-info {
    display: flex;
    align-items: center;
    background: #fff;
    justify-content: center;
    img {
      width: 200px;
      height: 200px;
    }
  }
  .info-title {
    padding: 10px;
    background: #fff;
    h3 {
      color: #333;
      font-size: 16px;
      margin-bottom: 5px;
    }
    span {
      color: #f0415f;
      font-size: 18px;
    }
    h4 {
      font-size: 14px;
      margin-top: 5px;
      color: #f0415f;
    }
    p {
      font-size: 13px;
      color: #f0415f;
      line-height: 20px;
      margin: 5px 0;
    }
  }
  .info-service {
    padding: 10px;
    background: #fff;
    margin-top: 10px;
    div {
      display: flex;
      p {
        font-size: 12px;
        color: #999;
        margin-right: 10px;
      }
    }
    p {
      font-size: 12px;
      color: #999;
    }
  }
  .pting {
    padding: 10px;
    background: #fff;
    margin-top: 10px;
    button{
      font-size: 14px;
      color: #999;
      background: #fff;
      border: 0;
      outline: none;
      height: 30px;
    }
  }
  .info-mion {
    background: #fff;
    margin-top: 10px;
    h2 {
      text-align: center;
      font-size: 14px;
      color: #000;
      width: 100%;
      height: 34px;
      border-bottom: 1px solid #e5e5e5;
      line-height: 34px;
    }
    div {
      width: 100%;
      img {
        width: 100%;
      }
    }
  }

  .van-button::before {
    border-radius: 0;
  }
  .van-goods-action-button--first {
    border-radius: 0;
    background: #008cff;
    color: #fff;
  }
  .van-sku-actions .van-button:first-of-type{
     border-radius: 0;
  }
  .van-sku-actions .van-button:last-of-type{
    border-radius: 0;
  }
  .van-sku-actions .van-button--warning{
    border-radius: 0;
    background: #008cff;
    color: #fff;
  }
  .van-goods-action-button--last {
    border-radius: 0;
    color: #fff;
    background: #e03d3d;
  }
  .van-sku-actions .van-button--danger{
    color: #fff;
    background: #e03d3d;
  }
}
</style>