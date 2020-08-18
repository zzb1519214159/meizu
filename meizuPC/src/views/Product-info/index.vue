<template>
  <div class="product-info">
    <img src="/image/product/product5/slider/3.jpg" alt="">
    <div class="product-container">
      <!-- 左边产品大图小图tab切换栏 -->
      <div class="product-l">
        <el-tabs
          type="border-card"
          tab-position="bottom"
        >
          <el-tab-pane 
          v-for="image in 4"
          :key="image">
            <div
              slot="label"
              class="img-box"
            >
              <span><img
                  :src="goodsinfo.img_url+'slider/'+image+'.jpg'"
                  alt=""
                ></span></div>
            <!-- :src="goodsinfo.img_url+image.index+'.jpg'" -->
            <img
            :src="goodsinfo.img_url+'slider/'+image+'.jpg'"
             alt="">
          </el-tab-pane>
        </el-tabs>
      </div>
      <!-- 右边产品参数栏 -->
      <div class="product-r">
        <h1 class="title">{{goodsinfo.title}}</h1>
        <h3 class="title-info">{{goodsinfo.subtitle}}</h3>
        <div class="price">
          <div><span class="money-icon">¥</span>
            <h1>{{goodsinfo.sell_price}}</h1>
          </div>
          <p><span class="discount">优惠券</span><span class="price-sell">满3699减200</span><span class="price-sell">满3999减300</span><span class="more">更多></span></p>
          <p><span class="discount">加购价</span><span class="price-add">{{goodsinfo.purchased}}</span><span class="more">立即加购></span></p>
        </div>
        <p><span class="s-space">支<span class="S-space"></span><span class="S-space"></span>持</span><i class="el-icon-circle-check icon"></i><span>花呗分期</span><i class="el-icon-circle-check"></i><span>顺丰发货</span><i class="el-icon-circle-check"></i><span>7天无理由退货(具体查看详情)</span></p>
        <div
          class="block"
          size="mini"
        >
          <span class="demonstration s-space">配送服务</span>
          <el-cascader
            v-model="value"
            :options="options"
          ></el-cascader>
        </div>
        <div>
          <div class="s-space s-type">型<span class="S-space"></span><span class="S-space"></span>号</div>
          <div class="float-left">
            <el-radio-group
              size="small"
              v-for="item in style"
              v-model="goodsinfo.title"
              :key="item.index"
            >
              <el-radio-button :label="item"></el-radio-button>
            </el-radio-group>
          </div>
        </div>
        <div>
          <span class="s-space">网络类型</span>
          <el-radio-group size="small">
            <el-radio-button>全网通公开版</el-radio-button>
          </el-radio-group>
        </div>
        <div>
          <span class="s-space  s-type">颜色分类</span>
          <div class="float-left">
            <el-radio-group
              size="small"
              v-model="radio"
              v-for="item in color"
              :key="item.index"
            >
              <el-radio-button
                :label="item"
                :border="true"
              ></el-radio-button>
            </el-radio-group>
          </div>
        </div>
        <div>
          <span class="s-space">内存容量</span>
          <el-radio-group
            size="small"
            v-model="radio"
            v-for="item in size"
            :key="item.index"
          >
            <el-radio-button :label="item"></el-radio-button>
          </el-radio-group>
        </div>
        <div>
          <span class="s-space s-type">选择套餐</span>
          <div class="float-left">
            <el-radio-group
              size="small"
              v-model="radio4"
              v-for="item in meal"
              :key="item.index"
            >
              <el-radio-button :label="item"></el-radio-button>
            </el-radio-group>
          </div>
        </div>
        <div class="number">
          <span class="s-space">数<span class="S-space"></span><span class="S-space"></span>量</span>
          <el-input-number
            v-model="num"
            :min="1"
            :max="10"
            label="描述文字"
            class="input-num"
          ></el-input-number>
        </div>
        <!-- 按钮 -->
        <el-row>
          <el-button
            type="primary"
            class="btn"
          >立即购买</el-button>
          <el-button
            plain
            class="btn btn-add"
            @click="addgoods"
          >加入购物车</el-button>
        </el-row>
      </div>
      <!-- 解决高度塌陷的空div -->
      <div class="null"></div>
    </div>
    <!-- 底部细节 -->
    <div class="product-detailimage">
      <div class="product-container">
        <h1>商品详情</h1>
        <div v-for="item in 8"
        :key="item.index"
        >
        <a href="">
          <img
            :src="goodsinfo.img_url+'pro_center/'+item+'.jpg'"
            alt=""
          >
        </a>
        </div>
      </div>
    </div>
    <el-backtop target="body"></el-backtop>
  </div>
</template>
<script>
// import Api from '../../api/modules/pjApi'
import axios from "axios";
export default {
  data: () => ({
    //小图列表
    activeName: "first",
    //商品详情
    goodsinfo: [],
    //地址选择
    value: [],
    options: [
      {
        value: "zhinan",
        label: "湖南",
        children: [
          {
            value: "shejiyuanze",
            label: "长沙",
            children: [
              {
                value: "yizhi",
                label: "岳麓区",
              },
              {
                value: "fankui",
                label: "芙蓉区",
              },
              {
                value: "xiaolv",
                label: "天心区",
              },
              {
                value: "kekong",
                label: "雨花区",
              },
            ],
          },
          {
            value: "daohang",
            label: "株洲",
            children: [
              {
                value: "cexiangdaohang",
                label: "荷塘区",
              },
              {
                value: "dingbudaohang",
                label: "株洲县",
              },
            ],
          },
        ],
      },
      {
        value: "zujian",
        label: "广东",
        children: [
          {
            value: "basic",
            label: "佛山市",
            children: [
              {
                value: "layout",
                label: "禅城区",
              },
              {
                value: "color",
                label: "南海区",
              },
              {
                value: "typography",
                label: "顺德",
              },
              {
                value: "icon",
                label: "三水区",
              },
              {
                value: "button",
                label: "高明区",
              },
            ],
          },
          {
            value: "form",
            label: "揭阳市",
            children: [
              {
                value: "radio",
                label: "揭东区",
              },
              {
                value: "checkbox",
                label: "榕城区",
              },
              {
                value: "input",
                label: "揭西县",
              },
              {
                value: "input-number",
                label: "惠来县",
              },
              {
                value: "select",
                label: "普宁市",
              },
            ],
          },
          {
            value: "data",
            label: "惠州市",
            children: [
              {
                value: "table",
                label: "惠城区",
              },
              {
                value: "tag",
                label: "惠阳区",
              },
              {
                value: "progress",
                label: "博罗县",
              },
              {
                value: "tree",
                label: "惠东县",
              },
              {
                value: "pagination",
                label: "龙门县",
              },
            ],
          },
          {
            value: "notice",
            label: "中山市",
            children: [
              {
                value: "notification",
                label: "中山市",
              },
            ],
          },
          {
            value: "navigation",
            label: "肇庆市",
            children: [
              {
                value: "menu",
                label: "端州市",
              },
              {
                value: "tabs",
                label: "鼎湖区",
              },
              {
                value: "breadcrumb",
                label: "封开县",
              },
              {
                value: "dropdown",
                label: "德庆县",
              },
              {
                value: "steps",
                label: "高要市",
              },
            ],
          },
          {
            value: "others",
            label: "广州市",
            children: [
              {
                value: "dialog",
                label: "荔湾区",
              },
              {
                value: "tooltip",
                label: "越秀区",
              },
              {
                value: "popover",
                label: "海珠区",
              },
              {
                value: "card",
                label: "天河区",
              },
              {
                value: "carousel",
                label: "白云区",
              },
              {
                value: "collapse",
                label: "黄浦区",
              },
            ],
          },
        ],
      },
      {
        value: "ziyuan",
        label: "北京",
        children: [
          {
            value: "axure",
            label: "北京市",
          },
        ],
      },
    ],
    //型号选择
    // 型号
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
    console.log(this.$store.state.pjStore.abc)
  },
  methods: {
    async getGoodsInfoById() {
      console.log("第" + this.id + "个商品");
      try {
        const {
          data: { message },
        } = await this.Api.pjApi.getGoodsInfoById(this.id);
        this.goodsinfo = message;
        this.style = JSON.parse(message.model);
        this.color = JSON.parse(message.Color);
        // console.log(this.goodsinfo.img_url + "slider/1.jpg");
        console.log(this.goodsinfo)
        // this.$Toast("请求成功")
      } catch (error) {
        // this.$Toast('图片详情请求失败'+error.message)
        console.log("商品详情请求失败" + error.message);
      }
    },
    //加入购物车
    async addgoods(){
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
        } = await this.Api.pjApi.getcartgoods(nid);//uid写死
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
  }
};
</script>
<style  lang="less">

.product-info {
  margin: 0;
  padding: 0;
  margin-top: 82px;

  .product-container {
    width: 1240px;
    margin: 0 auto;
    padding: 0;
      padding-bottom: 50px;
    .product-l {
      width: 50%;
      float: left;
      padding: 10px;
      box-sizing: border-box;
      .el-tabs {
        border: 0;
        box-shadow: 0 0 0 0;
        .el-tab-pane {
          img {
            width: 100%;
            height: 100%;
          }
        }
      }
      .el-tabs--border-card {
        .el-tabs__header {
          border: white;
          background-color: #fff !important;
          .is-buttom {
            border: white;
          }
          .is-active {
            border: 1px solid white;
            box-shadow: 0 10px 10px -10px #d1cfcf;
          }
          .el-tabs__item {
            padding: 0 12px;
            height: 120px;
            img {
              height: 120px;
              width: 120px;
            }
          }
        }
      }
    }
    .product-r {
      width: 50%;
      float: left;
      padding: 10px;
      box-sizing: border-box;
      font-size: 12px;
      color: #8c8c8c;
      line-height: 22px;
      .title {
        height: 46px;
        margin: 0;
        font-size: 28px;
        font-weight: 700;
        color: #262626;
      }
      .title-info {
        color: #e22841;
        font-size: 14px;
        margin: 0 0 10px 0;
        font-weight: 400;
      }
      .price {
        background-color: #f4f6fa;
        padding: 16px 10px 12px;
        color: #e02b41;
        font-size: 14px;
        margin-bottom: 10px;
        p{
          margin-top: 20px;
        }
        .money-icon {
          font-size: 24px;
        }
        h1 {
          display: inline-block;
          font-size: 36px;
          font-weight: 500;
          margin: 0;
        }
        .discount {
          line-height: 1;
          padding: 4px 8px;
          background: #f2eaef;
          border-radius: 2px;
        }
        .price-sell {
          padding: 0 15px;
        }
        .price-sell:nth-child(1) {
          border-right: 1px solid #e02b41;
        }
        .more {
          color: #008cff;
        }
        .price-add {
          display: inline-block;
          color: black;
          width: 200px;
          padding: 0 15px;
        }
      }

      .btn {
        padding: 15px 0px;
        // margin-right: 20px;
        width: 208px;
        // height: 24px;
        // line-height: 24px;
        // font-size: 20px;
      }
      .el-button {
        font-size: 20px;
      }
      .el-button--primary {
        background-color: #008cff;
      }
      .el-button--primary:hover {
        background-color: #3799e9;
      }
      .btn-add {
        border: 1px solid #008cff;
        color: #008cff;
      }
      .btn-add:hover {
        background-color: #eaf3fa;
      }
      // 支持
      .s-space {
        width: 75px;
        display: block;
        float: left;
        padding-left: 10px;
      }
      .S-space {
        display: inline-block;
        width: 12px;
      }
      .el-icon-circle-check {
        height: 20px;
        font-size: 20px;
        color: black;
        margin-right: 10px;
        margin-left: 20px;
      }
      .icon {
        margin-left: 0;
      }
      //配送服务
      .block {
        margin-top: 15px;
        margin-bottom: 15px;
        padding-bottom: 15px;
        border-bottom: 1px dashed rgb(207, 205, 205);
      }
      .el-cascader {
        border: 0;
        line-height: 30px !important;
        .el-input__inner{
            height: 30px !important;
            line-height: 30px;
            padding: 0 5px;
            // border: 0;
        }
        .el-input__icon{
          line-height: 30px !important;
        }
      }
      //型号
      .s-type {
        float: left;
      }
      .float-left {
        float: left;
        width: 500px;
      }
      .el-radio-group .is-active span {
        background-color: #fff;
        color: black;
        border: 1px solid black;
      }
      .el-radio-group span {
        width: 178px;
        padding: 0;
        line-height: 43px;
        height: 43px;
        margin-bottom: 10px;
        margin-right: 10px;
      }
      .el-radio-group span:hover {
        color: black;
      }
      //套餐
      //数量
      .number {
        margin-top: 10px;
        margin-bottom: 50px;
        .el-input-number {
          width: 150px;
          span:hover {
            color: black;
          }
          input{
            height: 40px !important;
          }
        }
      }
    }
    .null {
      clear: both;
    }
  }
  // 详情页下方图片拼接
  .product-detailimage {
    width: 100%;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    a {
      background-color: #f0efef;
      padding: 0;
    }
    img {
      display: block;
      width: 100%;
      height: 100%;
    }
    h1 {
      font-size: 24px;
      padding-top: 45px;
      padding-bottom: 20px;
      font-weight: normal;
    }
  }
}
</style>