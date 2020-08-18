<template>
<div class="Home">
 <div class="lunbo">
    <el-carousel height="680px" @change="getlunbos($event)">
      <el-carousel-item v-for="item in 8" :key="item">
          <img :src="'http://127.0.0.1:3000/home/lunbo/pc'+item+'.jpg'" alt="">
      </el-carousel-item>
    </el-carousel>
  </div>
  <div class="min-nav">
      <ul>
          <li>
              <img src="/image/section/1.png" alt="">
              <h3>魅族夏日福利</h3>
              <p>老用户享18个月保修</p>
          </li>
          <li>
              <img src="/image/section/2.png" alt="">
              <h3>魅族 17</h3>
              <p>限时赠全新壳膜套装</p>
          </li>
          <li>
              <img src="/image/section/3.png" alt="">
              <h3>魅族 17 Pro</h3>
              <p>碎屏保套餐立省50元</p>
          </li>
          <li>
              <img src="/image/section/4.png" alt="">
              <h3>mCycle</h3>
              <p>以旧换新</p>
          </li>
      </ul>
  </div>
<div class="section-phone-box">
      <h2 class="section-title">手机</h2>
      <div class="phone-lunbo">
  <img src="/image/section/adv1.jpg" alt="">
      </div>
      <div class="section-phone-mion">
        <ul>
            <li v-for="(item, index) in prountlist" :key="index" @click="goDetail('/Product-info',index+1)"><img :src="item.thumbnail_img" alt="">
            <div class="box-info ">
              <h2 class="goods-name">
                  {{item.title}}
              </h2>
              <span class="goods-desc">{{item.waptitle}}</span>
              <p><i>￥</i>{{item.sell_price}}</p>
              </div>
            </li>
        </ul>
      </div>
</div>

<div class="section-add-box">
      <h2 class="section-title">魅族声学</h2>
      <div class="add-lunbo">
          <img src="/image/section/adv2.jpg" alt="">
      </div>
      <div class="section-add-mion">
          <ul class="add-mion-left">
              <li style="background-image: url(/image/section/headset/1-1.jpg);">
            <div class="box-info ">
              <h2 class="goods-name">
                  魅族 EP3C 耳机
              </h2>
              <span class="goods-desc">Hi-Res 认证高解析音质 | Type-C数字接口</span>
              <p><i>￥</i>129</p>
              </div>
            </li>
            <li style="background-image: url(/image/section/headset/2-1.jpg);">
            <div class="box-info ">
              <h2 class="goods-name">
                  魅族 EP3C 耳机
              </h2>
              <span class="goods-desc">Hi-Res 认证高解析音质 | Type-C数字接口</span>
              <p><i>￥</i>129</p>
              </div>
            </li>
            <li style="background-image: url(/image/section/headset/3-1.jpg);"><img src="" alt="">
            <div class="box-info ">
              <h2 class="goods-name">
                  魅族 EP3C 耳机
              </h2>
              <span class="goods-desc">Hi-Res 认证高解析音质 | Type-C数字接口</span>
              <p><i>￥</i>129</p>
              </div>
            </li>
          </ul>
        <ul class="add-mion-con">
            <li v-for="(item, index) in ejlist" :key="index"><img :src="item.thumbnail_img" alt="">
            <div class="box-info ">
              <h2 class="goods-name">
                  {{item.title}}
              </h2>
              <span class="goods-desc">{{item.waptitle}}</span>
              <p><i>￥</i>{{item.sell_price}}</p>
              </div>
            </li>
        </ul>
      </div>
</div>
  <Comment></Comment>
</div>
</template>
<script>
import Comment from '../../components/Comment/index.vue'
import axios  from 'axios'
export default {
  data: () => ({
      prountlist:[],
      ejlist:[]
  }),
  created () {
      this.getGoodsmo()
      this.getlunbos()
  },
  methods: {
      getlunbos(index){
        
            if(index == 1 || index == 2 || index == 5){
            this.$store.state.zbStore.num = true;
            }else{
              this.$store.state.zbStore.num = false;
            }
         

         
      },
     async getGoodsmo(){
        try {
        const { data: { message } } = await this.Api.zbApi.getGoodsmo()
        const arrse = []
        message.forEach(el => {
            if(el.classify ==  2){
                arrse.push(el)
            }
        });
        this.ejlist = arrse
        for(var i=0;i<6;i++){
            this.prountlist.push(message[i])
        }
      } catch (error) {
        this.$alert('商品数据请求失败...')
      }
    },
  },
  components:{
      Comment
  }
};
</script>
<style lang="less">
.Home{
    background: #f7f7f7f7;
    .lunbo{
        position: relative;
        img{
            position: absolute;
            left: 50%;
            top: 0;
            transform: translateX(-50%);
        }
    }
    .min-nav{
        width: 100%;
        background: #fff;
        padding-top: 45px;
        margin-bottom: 50px;
        padding-bottom: 45px;
        ul{
            width: 1240px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            li{
                display: flex;
                flex-direction: column;
                align-items: center;
                h3{
                    color: #333;
                    font-size: 20px;
                }
                img{
                    width: 130px;
                    height: 130px;
                }
                p{
                    font-size: 14px;
                    color: #999;
                }
            }
        }
    }
    .section-phone-box{
        .phone-lunbo{
            width: 100%;
            height: 450px;
            background-color: #fff;
            border-bottom: 1px solid #eee;
            overflow: hidden;
            margin-bottom: 50px;
            position: relative;
            img{
                position: absolute;
                width: auto;
                height: auto;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
            }
        }
        .section-phone-mion{
            width: 1240px;
            margin: 0 auto;
            margin-bottom: 50px;
            ul{
                width: 100%;
                height: 100%;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                li:hover{
                    box-shadow: 0 15px 30px rgba(0,0,0,.1);
                }
                li:nth-child(1),li:nth-child(2){
                    width: 615px;
                    height: 610px;
                    position: relative;
                    img{
                        width: 460px;
                        height: 460px;
                       position: absolute;
                        bottom: 0;
                    }
                     .box-info {
                         position:absolute;
                         top: 58px;
                            h2{
                                font-size: 28px;
                            }
                            span{
                                font-size: 18px;
                            }
                        }
                }
                
                li{
                    width: 303px;
                    height: 375px;
                    display: flex;
                    flex-direction: column;
                    align-items:center;
                    margin-top: 10px;
                    background-color: #fff;
                    overflow: hidden;
                    transition: all .3s ease;
                    img{
                        width: 230px;
                        height: 230px;
                        margin-top: 30px;
                    }
                      .box-info {
                         padding: 20px;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        align-items: center;
                        h2{
                          color: #333;
                         font-size: 16px;
                         margin-bottom: 2px;
                          text-align: center;
                        }
                        span{
                          color: #999;
                            font-size: 14px;
                           display: -webkit-box;
                           -webkit-box-orient: vertical;
                           -webkit-line-clamp: 3;
                           overflow: hidden;
                        }
                        p{
                          color: #c00;
                          font-size: 22px;
                          padding-left: 14px;
                        }
                      }
                }
            }
        }

    }


    .section-add-box{
        .add-lunbo{
            width: 100%;
            height: 450px;
            background-color: #fff;
            border-bottom: 1px solid #eee;
            overflow: hidden;
            margin-bottom: 50px;
            position: relative;
            img{
                position: absolute;
                width: auto;
                height: auto;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
            }
        }
        .section-add-mion{
            width: 1240px;
            margin: 0 auto;
            margin-bottom: 50px;
            display: flex;
            .add-mion-left{
                width: 312px;
                li{
                    background-repeat: no-repeat;
                    background-size:cover;
                    background-position: center;
                    position: relative;
                    .box-info{
                        position: absolute;
                        bottom: 20px;
                        h2{
                          color: #fff;
                         font-size: 21px;
                            font-weight: 600;
                        }
                        span{
                          color: #fff;
                        
                        }
                        p{
                          color: #ebce6b;
                          font-size: 22px;
                          padding-left: 14px;
                          font-weight: 700;
                        }
                    }
                }
            }
            .add-mion-con{
                width: 918px;
            }
          
        }
         .section-add-mion{
            width: 1240px;
            margin: 0 auto;
            margin-bottom: 50px;
            ul{
                width: 100%;
                height: 100%;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                li:hover{
                    box-shadow: 0 15px 30px rgba(0,0,0,.1);
                }  
                li{
                    width: 303px;
                    height: 375px;
                    display: flex;
                    flex-direction: column;
                    align-items:center;
                    margin-top: 10px;
                    background-color: #fff;
                    overflow: hidden;
                    transition: all .3s ease;
                    img{
                        width: 230px;
                        height: 230px;
                        margin-top: 30px;
                    }
                      .box-info {
                         padding: 20px;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                        align-items: center;
                        h2{
                          color: #333;
                         font-size: 16px;
                         margin-bottom: 2px;
                          text-align: center;
                        }
                        span{
                          color: #999;
                            font-size: 14px;
                           display: -webkit-box;
                           -webkit-box-orient: vertical;
                           -webkit-line-clamp: 3;
                           overflow: hidden;
                           text-align: center;
                        }
                        p{
                          color: #c00;
                          font-size: 22px;
                          padding-left: 14px;
                        }
                      }
                }
            }
        }
    }

    // 公共样式
    
    .section-title{
    font-size:30px;
    font-weight: 400;
    color: #000;
    text-align: center;
    padding-bottom: 10px;
   }
}
</style>