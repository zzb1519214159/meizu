<template>
  <div class="cart">
    <div class="cart-header">
      <div class="header">
        <div class="logo">
          <a @click="goDetail('','')">
          <img
            src="../../../public/image/logo.png"
            alt=""
          >
          </a>
        </div>
        <el-breadcrumb separator-class="el-icon-arrow-right">
          <el-breadcrumb-item :to="{ path: '/' }">购物车</el-breadcrumb-item>
          <el-breadcrumb-item>确认订单</el-breadcrumb-item>
          <el-breadcrumb-item>在线支付</el-breadcrumb-item>
          <el-breadcrumb-item>完成</el-breadcrumb-item>
        </el-breadcrumb>
        <div
          class="cart-login"
          v-if="!isLogin"
        >
          <a href="">我的订单</a>
          <a href="">登录</a>
          <a href="">注册</a>
        </div>
        <div
          class="cart-islogin cart-login"
          v-else
        >
          <a href="">我的订单</a>
          <li class="cart-user">
            <span>{{username}}</span>的商城∨
            <ul>
              <li>地址管理</li>
              <li>我的收藏</li>
              <li>我的回购金</li>
              <li>问题反馈</li>
            </ul>
          </li>
        </div>

      </div>
    </div>
    <div class="cart-container" v-if="isLogin">
      <el-card class="box-card">
        <div
          slot="header"
          class="clearfix cart-title cart-flex"
        >
          <p><input
              type="checkbox"
              @click="selectAll"
              :checked="allChecked"
            >全选</p>
          <p>单价(元)</p>
          <p>数量</p>
          <p>小计</p>
          <p
            @click="edit"
            v-if="isDelete"
          >编辑</p>
          <p
            @click="edit"
            v-else
          >完成</p>
        </div>
        <!-- 商品列表 -->
        <div
          class="cart-flex cart-list"
          v-for="(good,index) in goodslist"
          :key="index"
          v-show="goodslist!==0"
        >
          <div class="cart-flex good-info">
            <input
              type="checkbox"
              @click="selectedSingle(index)"
              :checked="allSelectedGoods.indexOf(index)>=0"
            >
            <!-- :checked="true" -->
            <img
              :src="good.gImg"
              alt=""
            >
            <p class="good-info-title">
              <span>{{good.gName}}</span>
              <br>
              <span>{{good.gDesc}}</span></p>

          </div>
          <p class="price-one">¥{{good.gPrice}}.00</p>
          <p class="number">
            <el-input-number
              class="number-monen"
              v-model="good.gNumber"
              :min="1"
              label="描述文字"
              @change="changegoodsNum(good.gId,good.gNumber)"
            ></el-input-number>
          </p>
          <p class="price-total">¥{{good.gNumber*good.gPrice}}.00</p>
          <p
            class="edit"
            v-if="isDelete"
          >--</p>
          <p
            class="edit"
            @click="deletegoods(good.gId)"
            v-else
          >×</p>
        </div>
      </el-card>
      <!-- 结算区 -->
      <div class="cart-all">
        <el-card>
          <div class="cart-flex">
            <p><input
                type="checkbox"
                @click="selectAll"
                :checked="allChecked"
              >全选</p>
            <p>删除选中的商品</p>
            <p>共<span>{{goodslist.length}}</span>种商品,已选择<span class="selectedCount">{{selectedCount}}</span>种</p>
            <p>已优惠<span class="price-sell">0.00</span>元,合计(不含运费):<span class="price-all">¥{{totalPrice}}.00</span></p>
            <p>去结算</p>
          </div>
        </el-card>
      </div>
    </div>
    <div class="login" v-else>
      <div class="login-container">
        <div class="login-img">
          <img src="../../../public/image/pjimage.png" alt="">
        </div>
        <div class="login-text">
          <h1>您还没有登录</h1>
          <h2>登录后可显示您账号中的已加入的商品哦~</h2>
          <a href="">去登录</a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data: () => ({
    //默认没有登录
    isLogin: false,
    //编辑删除状态
    isDelete: true,
    //计数器的初始数字
    // num: "1",
    //全选
    username:'',
    allChecked: false, //控制全选
    allSelectedGoods: [], //存放被选择的数据
    //模拟商品数据
    goodslist: [],
  }),
  created() {
    this.getcartgoods()
  },
  methods: {
    //计数器的方法

    //全选功能
    
    selectAll() {
      if (!event.currentTarget.checked) {
        this.allSelectedGoods = [];
        this.allChecked = false;
      } else {
        this.allSelectedGoods = [];
        this.goodslist.forEach((el, index) => {
        this.allSelectedGoods.push(index);
          // this.allSelectedGoods.el.checked="true"
        });
        this.allChecked = true;
      }
      // console.log(this.allSelectedGoods);
    },
    //单选
    selectedSingle(index) {
      //如果是点击选中
      if (event.currentTarget.checked) {
        this.allSelectedGoods.push(index);
        if (this.allSelectedGoods.length === this.goodslist.length) {
          this.allChecked = true;
        }
      } else {
        //如果是取消选中
        for (var i = 0; i < this.allSelectedGoods.length; i++) {
          if (index === this.allSelectedGoods[i]) {
            this.allSelectedGoods.splice(i, 1);
            //取消全选
            this.allChecked = false;
            break;
          }
        }
      }
      // console.log(this.allSelectedGoods);
    },
    //编辑删除
    edit() {
      this.isDelete = !this.isDelete;
    },
    //删除功能
    async deletegoods(index){
      // console.log(index)
      if(confirm("你确定要删除此商品吗")){
        const Params={
          uId:JSON.parse(localStorage.getItem('userInfo')).uId,
          gId:index
        }
        console.log(Params,'删除')
        const {data:{err_code,message}}=await axios.post('/api/deletegoods',Params)
        if(message=='删除购物车成功'){
          alert(message)
          this.getcartgoods()
           
        }else{
          alert(message)
        }
      }
     
    },
    //购物车加减功能
    async changegoodsNum(Gid,Num){
        const Params={
          uId:JSON.parse(localStorage.getItem('userInfo')).uId,
          gId:Gid,
          gNumber:Num
        }
        const {data:{err_code,message}}=await axios.post('/api/changegoodsNum',Params)
        console.log(message)
    },
    //获取商品列表
    async getcartgoods() {
      
     
      //默认是没有登录的,判断有没有token,
      //没有就是this.isLogin=false
      //如果有token就把this.isLogin改为ture
    // console.log(this)
      if(localStorage.getItem('userInfo')){
        let nid = JSON.parse(localStorage.getItem('userInfo')).uId
        this.username = JSON.parse(localStorage.getItem('userInfo')).name
        console.log(this.username);
        this.isLogin=true
        try {
        const {
          data: { message },
        } = await this.Api.pjApi.getcartgoods(nid);//uid写死
        this.goodslist = message
         this.$store.state.pjStore.cartsList=this.goodslist
        // this.$Toast("请求成功")
      } catch (error) {
        // this.$Toast('图片详情请求失败'+error.message)
        console.log("商品详情请求失败" + error.message);
      }
      }
    },
  },
  computed: {
    //总价
    totalPrice() {
      var totalPrice = 0;
      this.goodslist.forEach((el, index) => {
        // console.log(el);
        if (this.allSelectedGoods.indexOf(index) !== -1) {
          totalPrice += el.gPrice * el.gNumber;
        }
      });
      return totalPrice;
    },
    //已选择多少件
    selectedCount() {
      var selectedCount = 0;
      selectedCount = this.allSelectedGoods.length;
      return selectedCount;
    },
  },
};
</script>
<style lang="less">
.cart {
  width: 100%;
  padding-bottom: 40px;
  background-color: #f4f6fa;
  //购物车头部
  .cart-header {
    width: 100%;
      height: 82px;
  display: flex;
  justify-content: center;
    background-color: #fff;
    .header {
      width: 1240px;
      margin: 0 auto;
      height: 80px;
      .logo {
        float: left;
        margin-top: 28px;
        img {
          display: block;
          width: 125px;
          height: 23px;
        }
      }
      .el-breadcrumb {
        float: left;
        font-size: 14px;
        margin-left: 130px;
        margin-top: 33px;
      }
      .cart-login {
        float: right;
        font-size: 12px;
        a {
          padding: 0 15px;
          line-height: 80px;
          text-decoration: none;
          color: #666666;
        }
        a:hover {
          color: rgb(102, 189, 240);
        }
      }
      .cart-islogin {
        list-style: none;
        .cart-user {
          padding: 10px 0;
          padding-left: 10px;
          width: 100px;
          position: relative;
          display: inline-block;
          color: #666666;
          // border: 1px solid #888888;
          ul {
            width: 112px;
            background-color: #fff;
            position: absolute;
            list-style: none;
            padding: 0;
            margin: 0;
            left: -1px;
            top: 30px;
            display: none;
            // border: solid 1px#000;
            li {
              padding: 5px 11px;
            }
          }
        }
        .cart-user:hover {
          color: rgb(102, 189, 240);
          ul {
            display: block;
            color: #888888;
          }
          ul li:hover {
            background-color: #f8f7f7;
          }
        }
      }
    }
  }
  .cart-container {
    width: 1240px;
    margin: 0 auto;
    padding-top: 20px;
    //已选择
    .selectedCount {
      color: #00c3f5;
    }

    //去除阴影
    .is-always-shadow {
      box-shadow: 0 0 0 0;
    }
    .el-card {
      width: 1240px;
      //购物车表格头部
      .el-card__header {
        padding: 0;
        padding-left: 24px;
      }
      .clearfix:before,
      .clearfix:after {
        display: table;
        content: "";
      }
      .clearfix:after {
        clear: both;
      }
      .cart-flex {
        height: 70px;
        display: flex;
        align-items: center;
      }
      .cart-title {
        font-size: 12px;
        color: rgba(51, 51, 51, 0.4);
      }
      .cart-title p:nth-child(1),
      .good-info {
        width: 520px;
        color: #333;
        cursor: pointer;
        font-size: 14px;
        //选择框大小
        input {
          display: inline-block;
          width: 15px;
          height: 15px;
        }
      }
      .cart-title p:nth-child(1){
        display: flex;
        align-items: center;
        input{
          margin-right: 50px;
        }
      }
      .cart-title p:nth-child(2),
      .price-one {
        width: 208px;
        text-align: center;
      }
      .cart-title p:nth-child(3),
      .number {
        width: 200px;
        text-align: center;
      }
      .cart-title p:nth-child(4),
      .price-total {
        width: 160px;
        text-align: center;
      }
      .cart-title p:nth-child(5),
      .edit {
        width: 110px;
        text-align: right;
        color: #00c3f5;
        cursor: pointer;
      }
      //购物车列表
      .el-card__body {
        padding: 0;
        // padding-left: 24px;
        .cart-list {
          // margin-bottom: 10px;
          padding: 10px 0 10px 24px;
          border-bottom: 1px solid #efefef;
         
          padding-bottom: 40px;
          padding-top: 40px;
        }
        //商品名称及参数
        .good-info {
          img {
            width: 100px;
            height: 100px;
            align-items: center;
            margin-left: 20px;
          }
          .good-info-title {
            font-size: 14px;
            color: #8c8c8c;
          }
          .good-info-title span:nth-child(1) {
            font-size: 16px;
            color: #262626;
          }
        }
        //单价
        .price-one {
          font-size: 16px;
          color: #666;
        }
        //数量
        .el-input-number {
          width: 85px;
          line-height: 24px;
          span {
            width: 24px;
            height: 21px;
            line-height: 22px;
            top: 2px;
          }
          .el-input__inner {
            padding: 0;
            height: 24px;
            line-height: 24px;
          }
        }
        //小计
        .price-total {
          color: #e02b41;
          font-size: 16px;
        }
        //编辑
        .edit {
          color: #333;
        }
      }
    }

    //底部结算
    .cart-all {
      padding-top: 20px;
      padding-bottom: 50px;
      .cart-flex {
        padding-left: 24px;
        align-items: center;
        color: #8c8c8c;
        font-size: 14px;
        position: relative;
      }
      .cart-flex p:nth-child(1) {
        color: black;
         input{
          margin-right: 50px;
        }
      }
      .cart-flex p:nth-child(2) {
        margin-left: 20px;
      }
      .cart-flex p:nth-child(3) {
        margin-left: 20px;
        span {
          padding: 0 5px;
        }
      }
      .cart-flex p:nth-child(4) {
        margin-left: 380px;
        .price-sell {
          color: #e02b41;
          padding: 0 5px;
        }
        .price-all {
          font-size: 20px;
          font-weight: bolder;
          color: #e02b41;
          margin-left: 14px;
        }
      }
      .cart-flex p:nth-child(5) {
        font-size: 14px;
        background-color: #f66567 !important;
        border-radius: 2px;
        padding: 10px 20px;
        color: white;
        position: absolute;
        right: 10px;
       
      }
    }
  }
  //未登录时
  .login{
    width: 1240px;
    margin: 0 auto;
    margin-top: 10px;
    height: 300px;
    background-color: #fff;
    position: relative;
    .login-container{
      position:absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%,-50%);
      .login-img{
            float: left;
            // height: 102px;
            // width: 133px;
            img{
              width: 100%;
              height: 100%;
            }
      }
      .login-text{
        float: left;
        margin-left: 15px;
        // width: 300px;
        h1{
          padding: 0;
          margin: 0;
          margin-bottom: 15px;
          margin-top: 5px;
          color: #666666;
          font-size: 18px;
        }
        h2{
          padding: 0;
          margin: 0;
          margin-bottom: 20px;
          font-size: 14px;
          color: #666666;
        }
        a{
          display: block;
          text-decoration: none;
          height: 36px;
          width: 130px;
          text-align: center;
          border-radius: 5px;
          line-height: 36px;
          font-size: 14px;
          color: #ffffff;
          background-color: #00c3f5;
        }
      }
    }
  }
   .number-monen{
    input{
      height:24px !important;
    }
  }
}
</style>