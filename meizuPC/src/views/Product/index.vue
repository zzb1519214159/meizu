<template>
  <div class="product-wrap clearfix">
    <div class="product-banner banner1" v-show="this.$route.params.id == 1">

    </div>
    <div class="product-banner banner2" v-show="this.$route.params.id == 2">

    </div>
    <div class="product-banner banner3" v-show="this.$route.params.id == 3">

    </div>
    <div class="product-banner banner4" v-show="this.$route.params.id == 4">

    </div>
    <div class="product-main">
      <div class="title">
        <h1 class="title-category">
          {{message.title}}
        </h1>
        <div class="title-filter">
          <a
            href="javascript:void(0)"
            :class="{'title-blue':titleflage==0}"
            @click=test(0)
          >推荐</a>
          <a
            href="javascript:void(0)"
            :class="{'title-blue':titleflage==1}"
            @click=test(1)
          >新品</a>
          <a
            href="
            javascript:void(0)"
            v-bind:class="[{price:true}, {up:!priceFlag},{down:priceFlag},{'title-blue':titleflage==2}]"
            @click=test(2)
          >价格</a>
        </div>
      </div>

      <div class="goods-list-wrap clearfix">
        <ul class="goods-list">
          <a
            v-for="(item, index) in goodsList"
            :key="index"
            @click="goDetail('/Product-info',item.id)"
          >
            <li class="goods-li">
              <div class="img-wrap">
                <el-image
                  :src="item.thumbnail_img"
                  alt=""
                  class="goods-list-img"
                  lazy
                >
                </el-image>
                <ul class="color-box">
                  <li></li>
                </ul>
                <h2 class="name">
                  {{item.title}}
                </h2>
                <p class="subtitle">{{item.subtitle}}</p>
                <p class="pricebox"><em>￥</em><span class="price">{{item.sell_price}}</span></p>
              </div>
            </li>
          </a>
        </ul>
      </div>

      <div class="recommend">
        <div class="title">
          <h1 class="title-category">
            为您推荐
          </h1>
        </div>
        <div class="recommend-list">
          <ul ref="recommend">
            <li
              v-for="(item, index) in recommendList"
              :key="index"
              @mouseenter="imgzoom($event,item)"
              @mouseleave="imgzoom($event,item)"
            >
              <a
                href=""
                class="rs-item-wrap"
              >
                <div class="rs-img-box">
                  <el-image
                    :src="item.img_url"
                    :class="['recommend-img',{'recommend-img-zoom':item.zoom}]"
                  >
                  </el-image>
                </div>
                <h4 class="vm-title">{{item.title}}</h4>
                <p class="vm-price"><span>￥</span><span class="vm-price-text">{{item.sell_price}}</span></p>
              </a>
            </li>
          </ul>
        </div>
        <div class="recommend-btn-box">
          <ul>
            <li
              v-for="num in btnlist"
              :key="num"
              @click="btnClick(num)"
              :class="{'btn-active':num===btnnum}"
            ></li>
          </ul>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
import data2 from './data2'
import axios  from 'axios'
export default {
  data () {
    return {
      message: {
        title: '生活周边'
      },
      titleflage: 0,
      goodsList:[],
      recommendList: "",
      priceFlag: true,
      btnlist: "",
      btnnum: 1,
      timer: "",
      recommendWidth: "",
    }
  },
  created () {
    this.imgs()
    this.getGoodsmo()
  },
  updated(){
    // console.log(this.$route.params.id)
     var id = this.$route.params.id
     this.getGoodsmo(id)
  },
  mounted () {
    this.recommendWidth = data2.length * 310
    this.$refs.recommend.style.width = this.recommendWidth + "px"
    
  },
  methods: {
    async getGoodsmo(id){
        try {
        const { data: { message } } = await this.Api.zbApi.getGoodsmo()
        const arr=[]
        message.forEach(el =>{
          if(el.classify == id){
            arr.push(el)
          }
        })
          this.goodsList = arr
          console.log(message)
      } catch (error) {
        this.$alert('商品数据请求失败...')
      }
    },
    imgs () {
      data2.forEach(ele => {
        ele.zoom = false
      })
      this.recommendList = data2
      this.btnlist = Math.ceil(data2.length / 3)
    },
    imgzoom (e, item) {
      if (e.type === 'mouseenter') {
        item.zoom = true
      }
      if (e.type === 'mouseleave') {
        item.zoom = false
      }
    },
    test (num) {
      if (num == 0 || num == 1) {
        this.titleflage = num
      } else {
        this.titleflage = num
        if (this.priceFlag === true) {
          this.goodsList.sort((a, b) => {
            return a.sell_price - b.sell_price
          })
        } else {
          this.goodsList.sort((a, b) => {
            return b.sell_price - a.sell_price
          })
        }
        this.priceFlag = !this.priceFlag

      }
    },
    btnClick (num) {
      if (this.btnnum === num) return
      if (num > this.btnnum) {
        let target = -(num - 1) * 3 * 310
        if (num * 3 >= this.recommendList.length) {
          target = -(this.recommendWidth - 1240)
        }
        this.moveLeft(num, target)
      } else {
        let target = -(num - 1) * 3 * 310
        if (num === Math.ceil(this.recommendList.length / 4) - 1) {
          target = (this.recommendList.length % 4) * 310
        }
        this.moveLeft(num, target)
      }


    },
    moveLeft (num, target) {
      clearInterval(this.timer)
      this.btnnum = num
      this.timer = setInterval(() => {
        let current = this.$refs.recommend.offsetLeft
        let step = (target - current) / 40
        step = step > 0 ? Math.ceil(step) : Math.floor(step)
        this.$refs.recommend.style.left = current + step + 'px'
        if (current === target) {
          this.$refs.recommend.style.left = target + 'px'
          clearInterval(this.timer)
        }
      }, 5)

    }
  },
};
</script>
<style lang="less" scoped>
.product-banner{
    width: 100%;
    height: 450px;
    background-color: #f2f2f2;
    background-position: center 0;
    background-repeat: no-repeat;
    background-size: cover;
    margin-top: 82px;
}
.banner1{
  background-image: url(../../../public/image/product/1.jpg);
}
.banner2{
  background-image: url(../../../public/image/product/2.jpg);
}
.banner3{
  background-image: url(../../../public/image/product/3.jpg);
}
.banner4{
  background-image: url(../../../public/image/product/4.jpg);
}
.clearfix::after {
  content: ".";
  display: block;
  visibility: hidden;
  overflow: hidden;
  font-size: 0;
  clear: both;
}
.product-wrap {
  background-color: #f4f4f4;
  overflow: hidden;
  width: 100%;
}
.product-main {
  width: 1240px;
  min-height: 100%;
  margin: auto;
  font-family: Helvetica, Tahoma, Arial, "PingFang SC", "Hiragino Sans GB",
    "Heiti SC", STXihei, "Microsoft YaHei", SimHei, "WenQuanYi Micro Hei";
  .title {
    clear: both;
    margin-top: 87px;
    margin-bottom: 25px;
    line-height: 1;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    .title-category {
      color: #515151;
      font-weight: 400;
      font-size: 30px;
    }
    .title-filter {
      position: relative;
      font-size: 18px;
      font-weight: 300;
      line-height: 20px;
      margin-right: 15px;
      a {
        text-decoration: none;
        color: #343434;
        float: left;
        width: 50px;
        height: 20px;
        // color: #008cff;
      }
      a:hover {
        color: #008cff;
      }
      .title-blue {
        color: #008cff;
      }
      .price::after {
        content: "";
        position: absolute;
        top: 12px;
        right: 0px;
        display: block;
        width: 0px;
        height: 0px;
        border: 5px solid transparent;
        border-top-color: inherit;
      }
      .price::before {
        content: "";
        position: absolute;
        top: 0px;
        right: 0px;
        display: block;
        width: 0px;
        height: 0px;
        border: 5px solid transparent;
        // border-bottom-color: #008cff;
        border-bottom-color: inherit;
      }
      .up::after {
        border-top-color: #343434;
      }
      .down::before {
        border-bottom-color: #343434;
      }
    }
  }
  .goods-list {
    a {
      width: 403px;
      height: 556px;
      display: block;
      float: left;
      margin: 0 15px 15px 0;
    }
    a:nth-of-type(3n) {
      margin-right: 0;
    }

    a:hover {
      animation: myshadow 0.3s linear forwards;
    }
    @keyframes myshadow {
      0% {
        box-shadow: 0 0 0 0px #fff;
      }
      100% {
        box-shadow: 0 10px 20px 0px #ccc;
      }
    }
    .goods-li {
      position: relative;
      float: left;
      width: 403px;
      height: 556px;
      background: #fff;
      box-sizing: border-box;

      .img-wrap {
        display: block;
        padding-top: 40px;
        padding-bottom: 28px;
        max-height: 556px;
        text-align: center;
      }
      .color-box {
        min-height: 20px;
        margin: 10px 0;
        opacity: 0;
        visibility: hidden;
      }
      .name {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        text-align: center;
        font-size: 23px;
        color: #333;
        padding-top: 1px;
        line-height: 1.5;
      }
      .subtitle {
        display: inline-block;
        margin: 5px auto;
        color: #666;
        text-align: center;
        min-height: 24px;
        font-size: 16px;
        font-weight: 300;
        max-width: 270px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
      }
      .pricebox {
        color: #c00;
        padding: 0 12px;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        .price {
          font-size: 24px;
        }
      }
      .goods-list-img {
        height: 320px;
        width: 320px;
      }
    }
  }
  .recommend-list {
    width: 100%;
    position: relative;
    height: 429px;
    overflow: hidden;
    background: #fff;
    border: 1px solid #fefefe;
    ul {
      margin: 0;
      padding: 0;
      position: absolute;
      li {
        width: 310px;
        margin-right: 0px;
        float: left;
        display: block;
        height: 429px;
        a {
          display: block;
          text-align: center;
          padding-top: 40px;
          padding-bottom: 44px;
          color: #666;
          .rs-img-box {
            height: 230px;
            width: 100%;
            position: relative;
            .el-image {
              width: 230px;
              min-height: 230px;
              left: 0;
              right: 0;
              margin: auto;
            }
            .recommend-img-zoom {
              position: absolute;
              width: 260px;
              height: 260px;
              margin-top: -15px;
            }
          }
          .vm-title {
            font-size: 21px;
            color: #2b2b2b;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            margin-top: 36px;
            text-align: center;
          }
          .vm-price {
            margin-top: 8px;
            font-size: 16px;
            color: #c00;
            .vm-price-text {
              font-size: 27px;
              line-height: 40px;
            }
          }
        }
      }
    }
  }
  .recommend-btn-box {
    height: 80px;
    position: relative;
    ul {
      position: absolute;
      margin: auto;
      left: 50%;
      top: 50%;
      transform: translate(-50%, -50%);
      overflow: hidden;
      li {
        float: left;
        display: inline-block;
        width: 11px;
        height: 11px;
        border-radius: 50%;
        border: 1px solid #a1a1a1;
        margin-right: 10px;
      }
      .btn-active {
        border: 1px solid transparent;
        background-color: #a1a1a1;
      }
    }
  }
}
</style>