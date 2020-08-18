<template>
<div class="comment">
<div class="section-comment-box">
      <h2 class="section-title">社区热贴</h2>
      <div class="section-comment-mion">
        <el-row>
          <el-col :span="6" v-for="(item, index) in lunlist" :key="index">
            <el-card :body-style="{ padding: '0px' }" shadow="hover" class="section-comment-list">
              <img :src="item.img_user" alt="">
              <div class="box-info ">
              <h2 class="goods-name">
                  <img :src="item.name_icon" alt="">
                  {{item.name}}
              </h2>
              <span class="goods-desc">{{item.title}}</span>
              <p>{{item.cons_txt}}</p>
              </div>
            </el-card>
          </el-col>
        </el-row>
      </div>
</div>
<div class="section-flyme-box">
    <h2 class="section-title">Flyme</h2>
    <div class="section-flyme-con">
        <ul>
            <li v-for="(item, index) in flymes" :key="index">
                <img :src="item.img" alt="">
                <p>{{item.title}}</p>
            </li>
        </ul>
    </div>
</div>
<div class="section-video-box">
    <h2 class="section-title">精彩视频</h2>
    <div class="section-video-con">
        <ul>
            <li v-for="(item, index) in videos" :key="index" @click="HonVcd(index)">
                <img :src="item.img" alt="">
                <p>{{item.title}}</p>
                <i></i>
            </li>
        </ul>
    </div>
</div>
<div class="video" v-show="flovcd">
<video width="320" height="240" controls autoplay :src="vcds" id="vcds">
  <source type="video/mp4">
</video>
<i class="el-icon-close" @click="deleavcd()"></i>
</div>
</div>

</template>
<script>
import getComments from "../../../public/data/comment.js"
import getflyme from "../../../public/data/flyme.js"
import getvideo from "../../../public/data/video.js"
export default {
  data: () => ({
      lunlist:[],
      flymes:[],
      videos:[],
      vcds:"",
      flovcd:false
  }),
  created () {
      this.getComment()
  },
  methods: {
      getComment(){
          this.lunlist = getComments
          this.flymes = getflyme
          this.videos = getvideo
          
      },
      HonVcd(index){
          this.flovcd = !this.flovcd
        let dvd = document.getElementById('vcds')
        console.log(this.videos[index]);
         this.vcds = this.videos[index].vcd;
         dvd.play(); 
      },
      deleavcd(){
         this.flovcd = !this.flovcd
          let dvd = document.getElementById('vcds')
        dvd.pause();
      }
  },
};
</script>
<style lang="less">
.comment{
.section-comment-box{
    margin-bottom: 50px;
    .section-comment-mion{
        width: 1240px;
        margin: 0 auto;
        .el-card__body{
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
       width: 303px;
       height: 375px;
        img{
        width:100%;
        height: 190px;
        }
      .box-info {
            padding: 20px;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: flex-start;
          h2{
            color: #333;
           font-size: 16px;
           margin-bottom: 2px;
           display: flex;
           justify-content: space-between;
           align-items: center;
           img{
               width: 36px;
                 height: 36px;
                 margin-right: 20px;
                 border: 1px solid #fff;
                 border-radius: 50%;
                 float: left;
                 box-shadow: 1px 1px 1px 1px #eee;
           }
          }
          span{
            color: #000;
            padding: 10px 0;
             font-size: 16px;
             line-height: 27px;
             text-align: left;
             height: 66px;
             display: -webkit-box;
             -webkit-box-orient: vertical;
             -webkit-line-clamp: 3;
             overflow: hidden;
          }
          p{
            color: #999;
            font-size: 12px;
            margin-top: 5px;
          }
        }
       }
    }
  }
  .section-flyme-box{
      margin-bottom: 50px;
      .section-flyme-con{
          width: 1240px;
          margin: 0 auto;
          ul{
              width: 100%;
              display: flex;
             flex-wrap: wrap;
             justify-content: space-between;
             li:nth-child(1){
                 width: 615px;
                height: 245px;
                 img{
                     width: 100%;
                     height: 100%;
                 }
             }
             li{
                 width: 303px;
                height: 245px;
                background: #fff;
                 margin-bottom: 15px;
                img{
                 display: block;
                 margin: 0 auto;
                 width: 100%;
                 height: 190px;
                }
                p{
                    margin: 0;
                    height: 55px;
                    font-size: 16px;
                    text-align: center;
                    color: #000;
                    line-height: 55px;
                }
             }
          }
      }
  }
}
.section-video-box{
.section-video-con{
     width: 1240px;
     margin: 0 auto;
     ul{
              width: 100%;
              display: flex;
             flex-wrap: wrap;
             justify-content: space-between;
          
             li{
                 width: 303px;
                height: 245px;
                background: #fff;
                 margin-bottom: 15px;
                 position: relative;
                img{
                 display: block;
                 margin: 0 auto;
                 width: 100%;
                 height: 190px;
                }
                p{
                    margin: 0;
                    height: 55px;
                    font-size: 16px;
                    text-align: center;
                    color: #000;
                    line-height: 55px;
                }
                i{
                    position: absolute;
                    width: 30px;
                    height: 30px;
                    display: block;
                    background: url("/image/video/vcd.png") no-repeat;
                    background-size: 100%;
                    right: 15px;
                    bottom: 65px;
                }
             }
          }
}
}
.video{
    width: 100vw;
    height: 100vh;
    position: fixed;
    top: 0;
    z-index: 99999;
    display: flex;
    justify-content: center;
    align-content: center;
    background: #000;
    video{
        width: 70%;
        height: 56.25%;
        padding-top: 10%;
    }
    i{
        color: #fff;
        font-size: 40px;
        position: absolute;
        top: 50px;
        right: 50px;
    }
}

.section-title{
    font-size:30px;
    font-weight: 400;
    color: #000;
    text-align: center;
    padding-bottom: 10px;
   }
    
  
</style>