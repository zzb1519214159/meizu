<template>
  <div :class="['header',{headeractive:show},{headeractive:!$route.meta.isshow}]"  v-show="!$route.meta.hehow">
    <div class="header_con">
      <h1 :class="['logo',{logocolor:show},{logoime:this.$store.state.zbStore.num},{logoime2:!$route.meta.isshow}]"  @click="goDetail('','')" >
        <i class="iconfont iconmeizu" ref="logoimen"></i>
      </h1>
      <div  :class="['header_nav',{navcolor: show},{navex:this.$store.state.zbStore.num},{navex2:!$route.meta.isshow}]" ref="headernav">
        <el-menu
          class="el-menu-demo"
          mode="horizontal"
          text-color="#000"
          active-text-color="#008cff"
        >
          <el-menu-item index="1"><a href="javascript:;" @mouseover="showflg(1)" @click="goDetail('/product',1)">手机</a></el-menu-item>
          <el-menu-item index="2"><a href="javascript:;" @mouseover="showflg(2)" @click="goDetail('/product',2)">声学</a></el-menu-item>
          <el-menu-item index="3"><a href="javascript:;" @mouseover="showflg(3)" @click="goDetail('/product',3)">配件</a></el-menu-item>
          <el-menu-item index="4"><a href="javascript:;" @mouseover="showflg(4)" @click="goDetail('/product',4)">生活</a></el-menu-item>
          <el-menu-item index="5"><a href="javascript:;">Flyme</a></el-menu-item>
          <el-menu-item index="6"><a href="javascript:;">服务</a></el-menu-item>
          <el-menu-item index="7"><a href="javascript:;">专卖店</a></el-menu-item>
          <el-menu-item index="8"><a href="javascript:;" @click="goDetail('/Community','')">社区</a></el-menu-item>
          <el-menu-item index="9"><a href="javascript:;">政企定制</a></el-menu-item>
          <el-menu-item index="10"><a href="javascript:;">APP下载</a></el-menu-item>
          <el-menu-item class="search-con">
            <div class="search">
              <el-input placeholder="请输入内容">
                <i
                  slot="suffix"
                  class="el-input__icon el-icon-search"
                ></i>
              </el-input>
            </div>

          </el-menu-item>
          <el-menu-item class="login">
            <el-dropdown placement="bottom">
              <span class="el-dropdown-link">
                <el-image src="/image/login-pc.png"></el-image>
              </span>
              <el-dropdown-menu slot="dropdown" class="login-down" v-show="!isLogin">
                <el-dropdown-item  v-show="!isLogin"> <a href="#" @click="goDetail('/Login','')">立即登录</a> </el-dropdown-item>
                <el-dropdown-item  v-show="!isLogin"> <a href="#" @click="goDetail('/Regsiter','')">立即注册</a> </el-dropdown-item>
                 <el-dropdown-item v-show="isLogin">欢迎用户{{username}}</el-dropdown-item>
                <el-dropdown-item>我的订单</el-dropdown-item>
                <el-dropdown-item>M码通道</el-dropdown-item>
                <el-dropdown-item v-show="isLogin"> <span @click="deletename()">退出登录</span> </el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
          </el-menu-item>
          <el-menu-item class="cart">
            <el-dropdown placement="bottom-end">
              <span class="el-dropdown-link">
                 <el-image src="/image/cart-pc.png"></el-image>
              </span>
              <el-dropdown-menu slot="dropdown" class="cart-down">
                <el-dropdown-item v-for="carts in $store.state.pjStore.cartsList" :key="carts.index">
                  <div class="cart-dow-con">
                    <img :src="carts.gImg" alt="">
                    <div class="cart-dow-title">
                      <p>{{carts.gName}}</p>
                      <p>{{carts.gPrice}}</p>
                      <p>{{carts.gDesc}}</p>
                    </div>
                    <div class="cart-dow-mun">
                     <a href="#">删除</a>
                    </div>
                  </div>
                </el-dropdown-item>
                 <div class="cart-dow-btn">
                      <p>共<span>{{$store.state.pjStore.cartsList.length}}</span>件商品</p>
                      <el-button size="medium" @click="goDetail('/Cart','')">去购物车</el-button>
                  </div>
              </el-dropdown-menu>
            </el-dropdown>
          </el-menu-item>
        </el-menu>
      </div>
    </div>
     <el-collapse-transition>
         <div class="nav-mais" v-show="show" @mouseover="showflgto()" @mouseout="showup()">
          <div class="nav-mais-con">
              <ul>
                <li v-for="(item, index) in dowlist" :key="index">
                  <div>
                    <img :src="item.thumbnail_img" alt="">
                    <p>【热卖】{{item.title}}</p>
                    <em>￥{{item.sell_price}}</em>
                  </div>
                </li>
              </ul>
          </div>
        </div>
      </el-collapse-transition>
   
  </div>
</template>
<script>
import axios  from 'axios'
export default {
  //  mixins: ['mixin'],
  data: () => ({
    show:false,
    dowlist:[],
    goodslist:[],
    isLogin:false,
    username:''
  }),
  created () {
    this.getcartgoods()
 
  },
    updated(){
      
    // console.log(this.$route.params.id)
   if(localStorage.getItem('userInfo')){
        let nid = JSON.parse(localStorage.getItem('userInfo')).uId
        this.username = JSON.parse(localStorage.getItem('userInfo')).name
        this.isLogin=true
      }
  },
  methods: { 
    
    // 購物車
    async getcartgoods() {
      //默认是没有登录的,判断有没有token,
      //没有就是this.isLogin=false
      //如果有token就把this.isLogin改为ture
      console.log(JSON.parse(localStorage.getItem('userInfo')))
      if(localStorage.getItem('userInfo')){
        let nid = JSON.parse(localStorage.getItem('userInfo')).uId
            this.username = JSON.parse(localStorage.getItem('userInfo')).name
        this.isLogin=true
        try {
        const {
          data: { message },
        } = await this.Api.pjApi.getcartgoods(nid);//uid写死
         this.goodslist = message;
        // this.$Toast("请求成功")
      } catch (error) {
        // this.$Toast('图片详情请求失败'+error.message)
        console.log("商品详情请求失败" + error.message);
      }
      }
      
    },

    async showflg(index){
        this.dowlist = []
        this.show = true
        try {
        const { data: { message } } = await this.Api.zbApi.getGoodsmo()
        
        for(var i=0;i<message.length;i++){
          if(message[i].classify == index){
            this.dowlist.push(message[i])
          }
        }
        console.log(this.dowlist)
         
      } catch (error) {
        this.$alert('商品数据请求失败...')
      }
    },
    showflgto(){
        this.show = true
    },
    showup(){
        this.show = false
     
    },
 

    deletename(){
      console.log(111)
      localStorage.clear();
      window.location.reload()
    }
  },
};
</script>
<style lang="less" >
.navex{
  color: #000 !important;
}
.logoime{
  color:#008cff!important;
}

.navex2{
  color: #000 !important;
}
.logoime2{
  color:#008cff!important;
}
.header{
  width: 100%;
  position: absolute;
  top: 0;
  background:  transparent;
  z-index: 999;
  transition:1s;
  
  .header_con{
    width: 1240px;
    height: 82px;
    margin: 0 auto;
   background: transparent;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .logo{
      height: 100%;
      display: flex;
      align-items: center;
      color: #fff;
      i{
        font-size: 24px;
        color: inherit;
      }
    }
    .header_nav{
      background: transparent;
        color: #fff;
      .el-menu.el-menu--horizontal{
        border: 0;
         display: flex;
      align-items: center;
      background: transparent;
       color: inherit !important;
      }
      .el-menu-item{
        border-bottom: none !important;
        color: inherit !important;
      }
      a:hover{
      color: #008cff;
      }
      .search-con{
        padding: 0 5px;
         .search{ 
        width: 170px;
        height: 30px;
        background: transparent;
       .el-input__inner{
          border-radius:20px;
        width: 170px;
        height: 30px;
            border: 1px solid #999;
            background: #fff;
            font-size: 12px;
        }
      }
      }
     
      .login,.cart{
        padding-left: 8px;
        padding-right: 0;
        text-align: right;
        background: transparent !important;
        img{
          width: 30px;
          height: 30px;
        }
      }
      .login{
        .el-dropdown{
          span{
            height:100%;
            width: 100%;
            display: inline-block;
          }
         
        }
      }
       
    }
  }
 
  .nav-mais{
    width: 100%;
  }
}
.navcolor{
  color: #000 !important;
}
.logocolor>i{
  color: #008cff !important;
}
.headeractive{
  background: #fff;
   transition: .3s;
}
 .cart-dow-con{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 0;
    img{
      width: 48px;
      height: 48px;
    }
    .cart-dow-title{
      margin: 0 20px;
      p{
        font-size: 12px;
        margin: 0;
        line-height: 12px;
        margin-bottom: 10px;
      }
    }
    .cart-dow-mun{
      a{
        font-size: 12px;
        color: #000;
      }
      a:hover{
        color: red;
      }
    }
}
.cart-dow-btn{
  padding: 0 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-top: 1px solid #eee;
    background-color: #FAFAFC;
    height: 66px;
     
      p{
        font-size: 12px;
        color: #000;
        margin-right: 20px;
        span{
          color: tomato;
          padding: 0 5px;
        }
      }
      button{
        color: #FFF;
    border-color: #00c3f5;
    background-color: #00c3f5;
      }
      button:hover{
          color: #FFF;
    border-color: #00c3f5;
    background-color: #00c3f5;
      }
    }
.el-dropdown-menu__item:not(.is-disabled):hover{
  background: transparent !important;
  color: #000 !important;
}
.el-menu--horizontal>.el-menu-item:not(.is-disabled):hover{
  background: transparent !important;
}
/* 导航登录下拉列表 */
.login-down{
  top: 60px !important;
  a{
    text-decoration: none;
    color: #000;
  }
}
.cart-down{
  top: 60px !important;
  padding: 0 !important;
}

// 导航分类下拉动画nav-mais
.nav-mais{
  width: 100%;
   background: #fff;
  .nav-mais-con{
    width: 1240px;
    height: 190px;
    background: #fff;
    margin: 0 auto;
    ul{
      height: 100%;
      padding-bottom: 20px;
      box-sizing: border-box;
      display:flex;
      justify-content: center;
      align-items:center;
      li{
       padding: 5px 5px 20px;
    width: 142px;
    height: 140px;
     box-sizing: border-box;
  opacity: 1;
     
        div{
          width: 100%;
     
        display: flex;
        flex-direction: column;
        align-items: center;
          img{
            width: 120px;
            height: 120px;
          }
          p{
            font-size: 12px;
            width: 142px;
            height: 20px;
            display: block;
            color: #333;
          text-align: center;
          overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
          }
          em{
            font-size: 12px;
            color: #333;
          }
        }
      }
       li:hover{
        opacity:1 !important;
      }
     
    }
    ul:hover li{
        opacity: .7;
      
    }
       
  }
}
</style>