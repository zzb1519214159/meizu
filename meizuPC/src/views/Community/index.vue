<template>
  <div class="community">
    <!-- 头部 导航 -->
    <div class="header">
      <div class="nav">
        <div class="nav-top">
          <div class="top-list">
            <ul class="list-litem">
              <li><a href="">官网</a></li>
              <li><a href="">Flyme</a></li>
              <li><a href="">专卖店</a></li>
              <li><a href="">服务</a></li>
            </ul>
            <div class="list-dow">
              <span class="el-icon-mobile-phone"></span>
              <a
                href=""
                @mouseenter="isenter"
              >APP下载</a>
            </div>
          </div>
        </div>
        <div
          class="wrap"
          style="width:100%;background:#ffffff;"
        >
          <div class="nav-bottom">
            <div class="logo">
              <a href=""><img
                  src="https://bbs.res.meizu.com/static_new/pc/pic/logo_blue_new.png"
                  alt=""
                ></a>
              <span><a href="">社区</a></span>
            </div>
            <div class="bottom-list">
              <ul class="bl-item">
                <li>精选</li>
                <li>综合讨论</li>
                <li>版块</li>
                <li>影像馆</li>
                <li>魅友家</li>
                <li id="input">
                  <el-input
                    placeholder="请输入内容"
                    suffix-icon="el-icon-search"
                  >
                  </el-input>
                </li>
              </ul>
            </div>
            <div class="user">
              <img
                src="//www3.res.meizu.com/static/cn/_partial/header/images/icon-user_47dae1a.jpg"
                alt=""
              >
            </div>
          </div>
        </div>
      </div>
      <div
        class="dowimg"
        v-if="dow"
        @mouseleave="isleave"
      >
        <div class="dowimg-box">
          <img
            src="https://bbs.res.meizu.com/static_new/pc/pic/935524fa-9d0b-420b-a485-105974823f40.jpg"
            alt=""
          >
        </div>
      </div>
    </div>
    <!-- contnet 内容 -->
    <div class="content">
      <!-- 左边区域 -->
      <div class="conttent-l">
        <!-- 轮播图 -->
        <div
          class="block"
          style=" width:100%; background:#ffffff;"
        >
          <el-carousel
            height="270px"
            arrow="never"
          >
            <el-carousel-item>
              <img
                style="width:100%; heigit:100%;"
                src="/image/fyel/adve1.jpg"
                alt=""
              >
            </el-carousel-item>
            <el-carousel-item>
              <img
                src="/image/fyel/adve1.jpg"
                alt=""
              >
            </el-carousel-item>
            <el-carousel-item>
              <img
                src="/image/fyel/adve1.jpg"
                alt=""
              >
            </el-carousel-item>
          </el-carousel>
        </div>
        <!-- 社区热帖 -->
        <div class="hot-thread cl">
          <div class="thread-header">
            <p>社区热帖</p>
            <ul>
              <li>今日发帖:7430</li>
              <li>历史最高:772086</li>
              <li class="none-border">会员:36691397</li>
            </ul>
          </div>
          <div
            class="thred-list"
            v-for="(item,index) in data2"
            :key="index"
          >
            <div class="list-item">
              <div class="item-img">
                <img
                  :src="item.user_img"
                  alt=""
                >
              </div>
              <ul class="item-content">
                <li><a
                    href=""
                    ckass="title"
                  >{{item.title}}</a></li>
                <li>
                  <span>{{item.user_name}}</span>
                  <span><i class="el-icon-lollipop"></i>{{item.look}}</span>
                  <span><i class="el-icon-place"></i>{{item.discuss}}</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div
          class="show"
          v-for="(item,index) in data1"
          :key="index"
        >
          <div class="show-img">
            <a href=""><img
                :src="item.image_url"
                alt=""
              ></a>
          </div>
          <div class="rt-main">
            <div class="rt-wrap">
              <p class="rt-title-name">{{item.type}}</p>
            </div>
            <p class="rt-href">
              <a href="">
                {{item.title}}</a>
            </p>
            <div class="rt-meta">
              <span class="readicon_uinfo_5"></span>
              <span class="spfont">{{item.look}}</span>
              <span class="replyicon_uinfo_5"></span>

              <span class="spfont">{{item.discuss}}</span>
              <span
                class="spfont"
                style="margin:0 0 0 20px;"
              >/<a
                  href=""
                  style="color:#9b9b9b;"
                >xrx3p</a></span>
              <span
                class="spfont"
                style="margin:0 0 0 20px;"
              >/<a
                  href=""
                  style="color:#9b9b9b;"
                >{{item.days_ago}}</a></span>
              <span
                class="spfont alte"
                style="float:right;"
              >
                <a
                  href=""
                  style="color:#008cff;"
                >阅读全文</a>
              </span>
            </div>
            <div class="contentmain">
              <p>{{item.content}}</p>
            </div>
            <div class="instal">
              <a href="">
                <img
                  src="https://cambrian-images.cdn.bcebos.com/a487b054820191e8e7a2fcf136b925b9_1551320091220.jpeg"
                  alt=""
                >
              </a>
            </div>
          </div>
        </div>

      </div>
      <!-- 右边区域 -->
      <div class="conttent-r">
        <!-- 签到 日历 -->
        <div class="ca-sg-box">
          <div class="block ">
            <el-date-picker
              v-model="value1"
              type="date"
              placeholder="请选择日期"
            >
            </el-date-picker>
          </div>
          <div class="sgin">
           
              <el-button
                type="primary"
                class="btns"
              >签到</el-button>
         
          </div>

        </div>
        <!-- 积分抽奖 -->
        <div
          style="margin-top:10px;"
          class="jf-cj"
        >
          <a href=""><img
              src="//bbs.res.meizu.com/static/image/common/shop1.png"
              alt=""
            ></a>
          <a href=""><img
              src="//bbs.res.meizu.com/static/image/common/lottery-new.png"
              alt=""
            ></a>
        </div>
        <div class="qr-code">
          <img
            src="//bbs.res.meizu.com/static_new/pc/pic/code_2.png"
            alt=""
          >
        </div>
        <!-- hot-area -->
        <div class="hot-area">
          <p class="r-title">热门版块</p>
          <div class="remove-border">
            <table style="width:100%;">
              <tbody>
                <tr class="odd">
                  <td>
                    <a href="">综合讨论</a>
                  </td>
                  <td>
                    <a href="">魅族手机</a>
                  </td>
                </tr>
                <tr class="">
                  <td>
                    <a href="">智能设备</a>
                  </td>
                  <td>
                    <a href="">Flyme</a>
                  </td>
                </tr>
                <tr class="odd">
                  <td>
                    <a href="">谈天说地</a>
                  </td>
                  <td>
                    <a href="">魅有家</a>
                  </td>
                </tr>
                <tr class="">
                  <td>
                    <a href="">摄影天地</a>
                  </td>
                  <td>
                    <a href="">魅族游戏</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!-- activity 最新活动 -->
        <div class="activity">
          <div class="activity-title">
            <p>最新活动</p>
          </div>
          <div class="line"></div>
          <div class="activity-content">
            <div class="li">
              <div class="img_1">
                <img
                  src="https://bbsimage.res.meizu.com/portal/2019/05/06/151215rxktp1jkkwjs1w7o.jpg"
                  alt=""
                >
              </div>
              <div class="mhometitle">
                <div class="title">上魅族官网购机</div>
                <div class="summary">官方自营 正品保障</div>
                <a href="">
                  <div class="but butt">立即参加</div>
                </a>
              </div>
            </div>
            <div class="li">
              <div class="img_1">
                <img
                  src="https://bbsimage.res.meizu.com/portal/2018/08/02/132850hmfjftvbxxybjbm0.jpg"
                  alt=""
                >
              </div>
              <div class="mhometitle">
                <div class="title">客户端反馈征集</div>
                <div class="summary">新社区APP反馈与建议征集</div>
                <a href="">
                  <div class="but ">立即参加</div>
                </a>
              </div>
            </div>
          </div>
        </div>
        <!-- 新人课堂  New classroom-->
        <div class="new-classroom">
          <div class="title">
            <span>新人课堂</span>
          </div>
          <div class="class-img">
            <img
              src="https://bbsimage.res.meizu.com/block/90/900744453c88d90ad094cdf01117de47.jpg"
              alt=""
            ></div>
          <div class="class-list">
            <ul>
              <li><a href="">反教系统</a></li>
              <li><a href="">新人指引</a></li>
              <li class="list-none"><a href="">社区版规</a></li>
            </ul>
            <ul>
              <li><a href="">反馈建议</a></li>
              <li><a href="">版权申述</a></li>
              <li class="list-none"><a href="">服务支持</a></li>
            </ul>
          </div>
        </div>
        <!-- 系统  system-->
        <div class="ststem">
          <el-tabs type="border-card">
            <el-tab-pane
              label="用户管理"
              class="ststem-but"
            >
              <span class="title">Flyme 8 体验版</span><br>
              <span class="titlex">发布日期：2019年9月24日</span><br>
              <span class="titlex">适用机型：16th 系列、15系列等</span>
            </el-tab-pane>
            <el-tab-pane
              label="配置管理"
              class="ststem-but"
            > <span class="title">Flyme 7.3.0.0A</span><br>
              <span class="titlex">发布日期：2019年9月24日</span><br>
              <span class="titlex">适用机型：16th 系列、15系列等</span></el-tab-pane>
          </el-tabs>
        </div>
        <div class="butNew">
          <button>下载更新</button>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
import data1 from "../../../public/data/discussion";
import data2 from "../../../public/data/psot";

export default {
  data: () => ({
    dow: false,
    activeIndex: "1",
    activeIndex2: "1",
    input2: "",
    value1: "",
    data1,
    data2,
  }),
  created() {},
  methods: {
    isenter() {
      this.dow = !this.dow;
    },
    isleave() {
      this.dow = !this.dow;
    },
    handleSelect(key, keyPath) {
     
    },
  },
};
</script>
<style lang="less" scoped>
html,
body {
  margin: 0;
  padding: 0;
  .community {
    margin-top: -8px;
    background-color: #f2f2f2 !important;
    a {
      text-decoration: none;
    }
    ul li {
      list-style: none;
    }
    .header {
      margin: 0;
      padding: 0;
      height: 98px;
      margin-bottom: 20px;
      // background: pink;
      width: 100%;
      .nav-top {
        width: 100%;
        height: 36px;
        background: #484848;
        .top-list {
          display: flex;
          justify-content: space-between;
          width: 1040px;
          height: 36px;
          margin: 0 auto;
          // background: red;
          .list-litem {
            align-items: center;
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            li {
              margin-left: 22px;
              a {
                height: 36px;
                font-size: 14px;
                color: #aaaaaa;
              }
            }
            a:hover {
              color: #ececec;
            }
          }
          .list-dow {
            display: flex;
            align-items: center;
            .el-icon-mobile-phone {
              font-size: 25px;
            }
            a {
              font-size: 14px;
              color: #aaaaaa;
            }
            a:hover {
              color: #ececec;
            }
            .el-menu-demo {
              background: #484848;
            }
          }
        }
      }
      .nav-bottom {
        width: 1040px;
        height: 82px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        .logo {
          margin-right: 80px;
          display: flex;
          align-items: center;
          a {
            margin-left: 10px;
            img {
              width: 140px;
              height: 25px;
            }
          }
          span {
            font-size: 20px;
            text-decoration:none;
            color: #000;
          }
        }
        .bottom-list {
          .bl-item {
            font-size: 16px;
            text-align: center;
            display: flex;
            li {
              margin-top: -10px;
              margin-left: 40px;
              color: #515151;
            }
            #input {
              margin-top: -20px;
              width: 210px;
              height: 26px;
            }
          }
        }
        .user {
          img {
            width: 36px;
            height: 36px;
          }
        }
      }
      .dowimg {
        width: 100%;
        position: absolute;
        top: 36 px;
        z-index: 1000;
        background: #ffffff;
        // display: none;
        .dowimg-box {
          width: 1040px;
          margin: 0 auto;
          padding: 10px;
          img {
            width: 100%;
            display: block;
          }
        }
      }
    }
    .content {
      width: 1040px;
      margin: 0 auto;
      margin-top: 140px;
      padding-top: 40px;
      background: #f4f4f4;
      // border: 1px solid #000;
      display: flex;
      justify-content: space-between;
      .conttent-l {
        width: 686px;
        .hot-thread {
          width: 686px;
          padding: 0 15px 15px;
          background: #ffffff;
          margin-top: 20px;
          background: #ffffff;
          box-sizing: border-box;
          .thread-header {
            display: flex;
            width: 100%;
            justify-content: space-between;
            height: 61px;
            p {
              margin: 0;
              padding: 0;
              height: 24px;
              padding: 18px 0;
              display: inline-block;
              font-size: 18px;
              color: #333;
            }
            ul {
              margin: 0;
              padding: 0;
              display: flex;
              text-align: right;
              align-items: center;
              li {
                font-size: 12px;
                line-height: 12px;
                margin-right: 30px;
                padding-right: 20px;
                border-right: 1px solid #e7e7e7;
              }
              .none-border {
                border: none;
              }
            }
          }
          .thred-list {
            padding: 25px 0 0 20px;
            float: left;
            width: 45%;
            .list-item {
              display: flex;
              width: 100%;
              .item-img {
                width: 34px;
                height: 34px;
                border-radius: 50%;
                margin-right: 10px;
                img {
                  width: 100%;
                  height: 100%;
                  border-radius: 50%;
                }
              }
              .item-content {
                margin: 0;
                padding: 0;
                li {
                  a {
                    display: inline-block;
                    font-size: 14px;
                    color: #333;
                    overflow: hidden;
                    width: 250px;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                  }
                  span {
                    margin-right: 25px;
                    font-size: 12px;
                    color: #999;
                    width: 75px;
                    text-overflow: ellipsis;
                    overflow: hidden;
                    white-space: nowrap;
                  }
                }
              }
            }
          }
        }
        .show {
          box-sizing: border-box;
          width: 686px;
          height: 243px;
          margin: 20px 0;
          padding: 14px 0 14px 14px;
          background: #ffffff;
          .show-img {
            float: left;
            img {
              width: 313px;
              height: 213px;
            }
          }
          .rt-main {
            float: left;
            padding: 0 19px;
            width: 319px;
            display: block;
            .rt-wrap {
              padding: 0 0 4px;
              white-space: nowrap;
              overflow: hidden;
              -o-text-overflow: ellipsis;
              text-overflow: ellipsis;
              .rt-title-name {
                margin: 0;
                padding: 0;
                background-color: #008cff;
                font-size: 16px;
                color: #fff;
                height: 34px;
                line-height: 34px;
                padding: 0 9px;
                float: left;
              }
            }
            .rt-href {
              a {
                color: #333;
                font-size: 16px;
                line-height: 30px;
                font-weight: 700;
              }
            }
            .rt-meta {
              font-size: 12px;
              margin: 12px 0 10px;
              overflow: hidden;
              .readicon_uinfo_5 {
                background: url(//bbs.res.meizu.com/resources/php/bbs/static/image/common/main_icon.png)
                  no-repeat scroll -120px -630px transparent;
                height: 14px;
                width: 22px;
                margin: 0 4px 0 0;
                float: left;
              }
              .spfont {
                font-size: 12px;
                line-height: 16px;
                display: block;
                height: 16px;
                float: left;
                color: #9b9b9b;
              }
              .replyicon_uinfo_5 {
                background: url(//bbs.res.meizu.com/resources/php/bbs/static/image/common/main_icon.png)
                  no-repeat scroll -150px -630px transparent;
                height: 16px;
                width: 19px;
                margin: 0 4px 0 20px;
                float: left;
              }
            }
          }
          .content {
            p {
              max-width: 330px;
              font-size: 14px;
              overflow: hidden;
              white-space: nowrap;
              text-overflow: ellipsis;
            }
          }
          .instal {
            a {
              img {
                width: 20px;
                height: 20px;
              }
            }
          }
        }
      }
      .conttent-r {
        width: 304px;
        padding: 16px;
        background: #ffffff;
        height: 1400px;
        .ca-sg-box {
          display: flex;
          background: #f7f7f7;
          height: 60px;
          align-items: center;
          .calendar {
            box-sizing: border-box;
            width: 50%;
            font-size: 16px;
            padding: 0 20px;
            color: #515151;
            i {
              margin-right: 5px;
              width: 20px;
              height: 20px;
            }
          }
          .sgin {
            width: 50%;
            .btns {
              width: 116px;
              border: none;
              height: 46px;
            }
          }
        }
        .jf-cj {
          display: flex;
          justify-content: space-between;
          a {
            img {
              width: 128px;
              height: 63px;
            }
          }
        }
        .qr-code {
          margin: 20px 0;
          height: 120px;
          width: 100%;
          img {
            height: 120px;
            width: 100%;
          }
        }
        .hot-area {
          p.r-title {
            color: #333;
            height: 50px;
            line-height: 50px;
            padding-bottom: 0;
            padding-top: 0;
            text-align: center;
            font-size: 14px;
            // margin-bottom: -14px;
            background-color: #fcfcfc;
            border-width: 2px 1px 0;
            border-style: solid;
            border-color: #008cff #eee transparent;
          }
          .remove-border {
            margin-top: -14px;
            width: 100%;
            overflow: hidden;
            table {
              width: 100%;
              border-collapse: collapse;
              border-spacing: 0;
              .odd {
                background: #fcfcfc;
              }
              td:hover a {
                color: skyblue;
              }
              td {
                width: 50%;
                text-align: center;
                font-family: Microsoft Yahei;
                font-size: 14px;
                border: 1px solid #eee;
                // background-color: #fcfcfc;
                a {
                  display: inline-block;
                  padding: 15px 0;
                  width: 100%;
                  color: #333;
                }
              }
            }
          }
        }
        .activity {
          width: 270px;
          margin-top: 25px;
          .activity-title {
            p {
              color: #333 !important;
              font-size: 16px;
              font-weight: 400;
              display: inline-block;
              height: 25px;
              line-height: 25px;
              font-weight: 700;
            }
          }
          .line {
            background-color: #e6e6e6;
            height: 1px;
            width: 100%;
            float: left;
            overflow: hidden;
          }
          .activity-content {
            padding-top: 15px;
            .li {
              margin: 0;
              margin-bottom: 15px;
              float: none !important;
              display: flex;
              .img_1 {
                text-align: left;
                width: 121px;
                img {
                  width: 121px;
                  height: 92px;
                }
              }
              .mhometitle {
                font-size: 14px;
                text-align: left;
                width: 128px;
                margin-left: 18px;
                height: auto;
                line-height: normal;
                .title {
                  font-size: 14px;
                  font-weight: 700;
                  padding: 0 !important;
                }
                .sunmmary {
                  line-height: 20px;
                  height: 44px;
                  width: 128px;
                  overflow: hidden;
                  font-size: 12px;
                  padding: 3px 0;
                }
                a {
                  .butt {
                    margin-top: 30px;
                  }
                  .but {
                    background-color: #008cff;
                    width: 60px;
                    text-align: center;
                    font-size: 12px;
                    color: #fff;
                    border-radius: 2px;
                    padding: 2px;
                    line-height: 20px;
                    height: 21px;
                  }
                }
              }
            }
          }
        }
        .new-classroom {
          margin-top: 15px;
          .title {
            padding: 0 10px;
            height: 32px;
            font-size: 18px;
            font-weight: 700;
            line-height: 32px;
            overflow: hidden;
            span {
              display: block;
              width: 100%;
              height: 20px;
              white-space: nowrap;
              text-overflow: ellipsis;
            }
          }
          .class-img {
            padding: 15px 0;
            border-top: 1px solid black;
            img {
              width: 100%;
            }
          }
          .class-list {
            ul {
              margin: 0;
              padding: 0;
              display: flex;
              margin-bottom: 10px;
              .list-none {
                border: none !important;
              }
              li {
                flex: 1;
                border-right: 1px dotted #cccccc;
                text-align: center;
                a {
                  color: #222222;
                  font-size: 14px;
                }
              }
            }
          }
        }
        .butNew {
          margin-top: 20px;
          button {
            width: 100%;
            height: 46px;
            background-color: #008cff;
            border: none;
            font-size: 18px;
            color: #fff;
            border: none !important;
          }
        }
      }
    }
  }
}
.cl::after {
  content: "";

  display: block;

  overflow: hidden;

  height: 0;

  clear: both;

  visibility: hidden;
}
</style>
<style lang="less">
#tab-0 {
  width: 152px;
  text-align: center;
}
#pane-0 {
  .title {
    font-size: 16px;
    font-weight: 600;
    line-height: 30px;
  }
  .titlex {
    font-size: 14px;
    line-height: 30px;
  }
}
#tab-1 {
  width: 152px;
  text-align: center;
}
#pane-1 {
  .title {
    font-size: 16px;
    font-weight: 600;
    line-height: 30px;
  }
  .titlex {
    font-size: 14px;
    line-height: 30px;
  }
}
.el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: 180px !important;
  height: 46px !important;
}

.el-input__inner{
  height: 46px !important;
}
</style>