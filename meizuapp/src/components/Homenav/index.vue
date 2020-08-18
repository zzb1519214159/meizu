<template>
<div class="home-nav"  v-show="!$route.meta.isshow">
   <!-- 头部区域 -->
   <van-nav-bar
  left-text="返回"
  right-text="按钮"
  left-arrow
 
  placeholder
  fixed
> <template #left>
  <a href="#"><i class="iconfont iconia_100000111"></i></a>
  </template>
  <template #title>
  <a href="/"><i class="iconfont iconmeizu"></i></a>
  </template>
<template #right>
  <a href="javascript:void(0)" @click="goDetail('cart','')"><i class="iconfont iconia_100000112"></i></a>
    <a href="javascript:void(0)" @click="getNav()"><i class="iconfont iconxiazai"></i></a>
  </template>
</van-nav-bar>
<div class="header-nav" id="header-nav">
<van-nav-bar title="魅族官网" @click-right="metNav()">
  <template #right>
    <van-icon name="cross" size="25" color="#000"/>
  </template>
</van-nav-bar>
<van-grid :column-num="4" :border="false" icon-size="3rem">
  <van-grid-item  icon="/image/header-nav/ia_100000000.png" text="个人中心" @click="goDetail('login','')" />
  <van-grid-item  icon="/image/header-nav/ia_100000001.png" text="我的订单" />
  <van-grid-item  icon="/image/header-nav/ia_100000002.png" text="我的红包" />
  <van-grid-item  icon="/image/header-nav/ia_100000003.png" text="我的优惠券" />
  <van-grid-item  icon="/image/header-nav/ia_100000004.png" text="我的地址" />
  <van-grid-item  icon="/image/header-nav/ia_100000005.png" text="我的收藏" />
</van-grid>
  
<van-grid :column-num="4" id="nav-wasps"  :border="false" icon-size="2rem">
  <van-grid-item  icon="/image/header-nav/ia_100000006.png" text="产品"/>
  <van-grid-item  icon="/image/header-nav/ia_100000007.png" text="Flyme"/>
  <van-grid-item  icon="/image/header-nav/ia_100000008.png" text="云服务"/>
  <van-grid-item  icon="/image/header-nav/ia_100000009.png" text="专卖店"/>
  <van-grid-item  icon="/image/header-nav/ia_100000010.png" text="服务支持"/>
  <van-grid-item  icon="/image/header-nav/ia_100000011.png" text="社区App"/>
  <van-grid-item  icon="/image/header-nav/ia_100000012.png" text="下载"/>
  <van-grid-item  icon="/image/header-nav/ia_100000013.png" text="政企定制"/>
</van-grid>

<van-grid :column-num="4" :border="false" icon-size="3rem">
  <van-grid-item  icon="/image/header-nav/ia_100000014.png" text="魅族17系列" />
  <van-grid-item  icon="/image/header-nav/ia_100000015.png" text="魅族16T" />
  <van-grid-item  icon="/image/header-nav/ia_100000016.png" text="以旧换新" />
  <van-grid-item  icon="/image/header-nav/ia_100000017.png" text="M码通道" />
</van-grid>
 
</div>
  <van-tabs v-model="active" id="vmi-box">
  <van-tab title="推荐" to="/home"></van-tab>
  <van-tab title="手机" to="/home/goodslist/1"></van-tab>
  <van-tab title="声学" to="/home/goodslist/2"></van-tab>
  <van-tab title="配件" to="/home/goodslist/3"></van-tab>
  <van-tab title="生活" to="/home/goodslist/4"></van-tab>
</van-tabs>
</div>

</template>
<script>
export default {
  data: () => ({
    path:'',
     active:"",
  }),
  created () {
    
  },
  methods: {
    getNav(){
          let nav = document.getElementById('header-nav');
         nav.style.transform = 'translate(0)'
      },
     metNav(){
      
        let nav = document.getElementById('header-nav');
         nav.style.transform = 'translateY(-250vw)'
     },
    
  },
};
</script>
<style lang="less">
a{
  text-decoration: none;
  color: #000;
}

.van-nav-bar__title{
  i{
    font-size: 12px;
    color: #008cff;
  }
}
.van-nav-bar__right{
    a{
      margin-left: 20px;
    }
}
.van-grid-item__content{
 background: none !important;
padding: 1rem 0.5rem !important;
}
.header-nav{
    position: absolute;
    top: 0;
    width: 100vw;
    height: 100vh;
    background: #fff;
    z-index: 9;
    transform: translateY(-250vw);
    transition: transform .8s;
}
.van-nav-bar{
    height: 60px;
}
#nav-wasps{
    background: #fafafa;
   
}

  .van-tabs__nav{
    justify-content: space-around;
  }
  .van-tab{
    flex-basis: 15% !important;
  }
  .van-tabs__line{
    background: #008cff;
     z-index: 0;
  }
  .van-tab--active{
    color:#008cff;
  }
  .van-tabs__line{
    background-color: #008cff !important;
    display: none;
  }
  

</style>