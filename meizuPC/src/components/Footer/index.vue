<template>
  <div class="footer">
    <div class="footer-con">
      <ul class="footer-list">
        <li
          v-for="(item, index) in footerarr"
          :key="index"
        >
          <a href="#">
            <img :src="'/image/footer/'+(index+1)+'.png'">
            <span>{{item}}</span>
          </a>
        </li>
      </ul>
      <div class="footer-hotline">
        <p>周一至周日 8:00-20:00</p>
        <h3>400-788-3333</h3>
        <el-button
          type="primary"
          round
          class="foter-btn"
        >在线客服</el-button>
      </div>
    </div>
    <div class="footer-bot">
        <h4>了解魅族
        | 加入我们
        | 联系我们
        | Flyme
        | 魅族社区
        | 天猫旗舰店
        | 问题反馈
        | 线上销售授权名单公示
        | 出版物经营许可证
        | 简体中文</h4>
        <div class="bot-title">
            <p>©2019MeizuTelecomEquipmentCo.,Ltd.Allrightsreserved.    粤ICP备13003602号合字B2-20170010 营业执照法律声明粤公网安备 44049102496009 号</p>
            <div class="bot-icon">
                <ul>
                    <li><img src="/image/footer/bot1-1.png" alt=""></li>
                    <li><img src="/image/footer/bot2-1.png" alt=""></li>
                    <li><img src="/image/footer/bot3-1.png" alt=""></li>
                    <li><img src="/image/footer/bot4-1.png" alt=""></li>
                </ul>
                
            </div>
        </div>
    </div>
  </div>
</template>
<script>
export default {
  data: () => ({
      footerarr:['满80免运费','100+ 城市次日送达','7天无理由退货','15天换货保障','1年免费保修','上门快修']
  }),
  created () {},
  methods: {},
};
</script>
<style lang="less">
.footer{
     padding: 48px 0 20px;
    border-top: 1px solid #f1f1f1;
    .footer-con{
        max-width: 1240px;
        margin: 0 auto;
        padding-bottom: 40px;
        margin-bottom: 20px;
        border-bottom: 1px solid #eee;
        display: flex;
        justify-content: space-between;
        align-items: center;
        .footer-list{
            width: 78%;
            display: flex;
            justify-content: space-between;
            li{
                width: 15%;
                img{
                    width: 50px;
                }
                a{
                    display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-decoration: none;
                    span{
                        line-height: 30px;
                        color: #999;
                        font-size: 14px;
                     }
                }
            }
        }
        .footer-hotline{
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            p{
                color: #999;
                font-size: 12px;
                line-height: 30px;
            }
            h3{
                color: #008cff;
                font-size: 25px;
                font-weight: 400;
                margin-top: -6px;
                line-height: 40px;
            }
            .foter-btn{
                height: 30px;
               padding: 0 16px;
               overflow: hidden;
               position: relative;
               text-align: center;
               line-height: 30px;
               color: #fff;
               border-radius: 20px;
               margin-top: 3px;
               display: inline-block;
               font-size: 14px;
               background: #008cff;
            }
        }
    }
    .footer-bot{
         max-width: 1240px;
        margin: 0 auto;
        h4{
            font-size: 12px;
            color: #999;
            word-spacing:15px;
        }
        .bot-title{
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: 20px;
            p{
                font-size: 12px;
                color: #999;
                word-spacing:15px;
            }
            .bot-icon{
                width: 160px;
                height: 25px;
                ul{
                    display: flex;
                    justify-content: space-between;
                    li{
                        img{
                            width: 20px;
                            height: 20px;
                        }
                    }
                }
            }
        }
    }
}
</style>