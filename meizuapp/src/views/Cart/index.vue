<template>
  <div class="cart">
    <van-nav-bar
      title="购物车"
      right-text="编辑"
      left-text=""
      left-arrow
      @click-left="onClickLeft"
      @click-right="edit"
      v-if="isDelete"
    />
    <van-nav-bar
      title="购物车"
      right-text="完成"
      left-text=""
      left-arrow
      @click-left="onClickLeft"
      @click-right="edit"
      v-else
    />
    <div class="cart-list">
      <div class="allcheck-box">
        <input
          type="checkbox"
          @click="selectAll"
          :checked="allChecked"
        >全选
      </div>
      <div
        class="cart-item"
        v-for="(item, index) in goodslist"
        :key="index"
      >
        <div class="cart-l">
          <input
            type="checkbox"
            @click="selectedSingle(index)"
            :checked="allSelectedGoods.indexOf(index)>=0"
            v-if="isDelete"
          >
          <span v-else @click="deletegoods(item.gId)">×</span>
        </div>
        <div class="cart-r">
          <van-card
            :price="item.gPrice+'.00'"
            :desc="item.gDesc"
            :title="item.gName"
            :thumb="item.gImg"
          >
            <div slot="num">
              <van-stepper
                v-model='item.gNumber'
                @change="changegoodsNum(item.gId,item.gNumber)"
              />
            </div>
          </van-card>
        </div>
      </div>
    </div>

    <van-submit-bar
      :price="totalPrice*100"
      button-text="提交订单"
      @submit="onSubmit"
    />

  </div>
</template>
<script>
import axios from "axios";
export default {
  data: () => ({
    //默认没有登录
    isLogin: false,
    //编辑删除状态
    isDelete: true,
    //计数器的初始数字
    // num: "1",
    //全选
    username: "",
    allChecked: false, //控制全选
    allSelectedGoods: [], //存放被选择的数据
    //模拟商品数据
    goodslist: [],
  }),
  created() {
    this.getcartgoods();
  },
  methods: {
    onClickLeft() {
      this.$router.go(-1);
    },
    onSubmit() {},
    //全选功能
    selectAll() {
      if (!event.currentTarget.checked) {
        this.allSelectedGoods = [];
        this.allChecked = false;
      } else {
        this.allSelectedGoods = [];
        this.goodslist.forEach((el, index) => {
          this.allSelectedGoods.push(index);
        });
        this.allChecked = true;
      }
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
    },
    //编辑删除
    edit() {
      this.isDelete = !this.isDelete;
    },
    //删除功能
    async deletegoods(index) {
      // console.log(index)
      if (confirm("你确定要删除此商品吗")) {
        const Params = {
          uId: JSON.parse(localStorage.getItem("userInfo")).uId,
          gId: index,
        };
        console.log(Params, "删除");
        const {
          data: { err_code, message },
        } = await axios.post("/api/deletegoods", Params);
        if (message == "删除购物车成功") {
          alert(message);
          this.getcartgoods();
        } else {
          alert(message);
        }
      }
    },
    //购物车加减功能
    async changegoodsNum(Gid, Num) {
      const Params = {
        uId: JSON.parse(localStorage.getItem("userInfo")).uId,
        gId: Gid,
        gNumber: Num,
      };
      const {
        data: { err_code, message },
      } = await axios.post("/api/changegoodsNum", Params);
      console.log(message);
    },
    //获取商品列表
    async getcartgoods() {
      //默认是没有登录的,判断有没有token,
      //没有就是this.isLogin=false
      //如果有token就把this.isLogin改为ture
      // console.log(this)
      if (localStorage.getItem("userInfo")) {
        let nid = JSON.parse(localStorage.getItem("userInfo")).uId;
        this.username = JSON.parse(localStorage.getItem("userInfo")).name;
        // console.log(this.username);
        this.isLogin = true;
        try {
          const {
            data: { message },
          } = await this.Api.getcartgoods(nid); //uid写死
          this.goodslist = message;
          console.log(message);
          //  this.$store.state.pjStore.cartsList=this.goodslist
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
<style lang="less" scoped>
.cart {
  width: 100%;

  .cart-list {
    .allcheck-box {
      padding-left: 30px;
      background-color: #fafafa;
      // margin-top: 20px;
  
      input {
        margin-right: 10px;
      }
     
    }
    .cart-item {
      border: 1px solid #eee;
      display: flex;
      background-color: #fafafa;
      margin-top: 10px;
      justify-content: space-between;
      .cart-l {
        line-height: 104px;
        margin-left: 30px;
      }
      .cart-r {
        width: 100%;
        box-sizing: border-box;
        .van-card {
          .van-card__header{
           display: flex;
          align-items: center;
          .van-card__price {
            color: #cc0000;
          
          }
          }
      
          
        }

          .van-card__thumb{
              width: 50px;
              height: 50px;
            }
      }
    }
  }
}
</style>
