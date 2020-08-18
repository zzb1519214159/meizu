<!--
 * @Author: your name
 * @Date: 2020-08-10 08:48:37
 * @LastEditTime: 2020-08-12 20:05:07
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \meizu\meizu\src\views\Regsiter\index.vue
-->
<template>
  <div class="register">
    <div class="content">
      <div class="ucSimpleHeader">
        <a
          href="/"
          class="meizuLogo"
        >
          <i class="iconfont iconmeizu"></i>
        </a>
      </div>
      <div class="banner-box">
        <div class="bg-box">
          <form class="main-form">
            <div class="tab-title">
              <a
                href="javascript:void(0)"
                class="linkABlue"
              >登录 Flyme 账号</a>
            </div>
            <div
              class="tip-box"
              v-show="isClose"
            >
              <i class="err-ico"></i>
              <span class="tip-font"></span>
              <span
                class="close-ico"
                @click="close"
              ></span>
            </div>
            <el-input
              class="user"
              placeholder="请输入用户名"
              v-model="input1"
              clearable
            >
            </el-input>
            <el-input
              class="phone"
              placeholder="请输入手机号"
              v-model="input2"
              clearable
            >
            </el-input>
            <el-input
              type="password"
              class="password"
              placeholder="请输入密码"
              v-model="input3"
              clearable
            >
            </el-input>
            <el-button
              type="primary"
              round
              class="btn"
              @click="login()"
            >登录</el-button>
            <a
              href="javascript:void(0)"
              @click="toRegsiter"
              class="login"
            >注册</a>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    input1: "",
    input2: "",
    input3: "",
    checked: false,
    isClose: false,
    userInfo: {},
    id:''
  }),

  created() {},

  methods: {
    close() {
      this.isClose = false;
    },

    toRegsiter() {
      console.log(this.$router.push("/Regsiter"));
    },

    async getInfo(info) {
      try {
        const data = await this.Api.shApi.getInfo(info);
        if (data.data.status == -1) {
          alert("登录失败！");
          
          return;
        } else if (data.data.status == 1) {
           this.userInfo.uId = data.data.message[0].uId;
             this.userInfo.name = this.input1;
            this.userInfo.phone = this.input2;
            this.userInfo.password = this.input3;
            const str = JSON.stringify(this.userInfo);
            localStorage.setItem("userInfo", str);
          alert("登录成功，正在前往首页！");
          this.$router.push("/");
          this.getcartgoods()
        }
      } catch (error) {
        console.log("用户信息请求失败...");
      }
    },


    login() {
      if (this.input1 == "" || this.input2 == "" || this.input3 == "") {
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "您的输入有误！";
        return;
      }
       
      const info = {};
      info.uName = this.input1;
      info.uPhone = this.input2;
      info.uPwd = this.input3;
      this.getInfo(info);
     
    },
     async getcartgoods() {
      if(localStorage.getItem('userInfo')){
        let nid = this.userInfo.uId
        this.username = this.userInfo.name
        try {
        const {
          data: { message },
        } = await this.Api.pjApi.getcartgoods(nid);
        this.$store.state.pjStore.cartsList= message;
      } catch (error) {
        console.log("商品详情请求失败" + error.message);
      }
      }
      
    },
  },
};
</script>

<style lang="less">
.register {
  min-height: 800px;

  .content {
    width: 100%;

    .ucSimpleHeader {
      max-width: 1200px;
      height: auto;
      padding-top: 28px;
      padding-bottom: 40px;
      margin: 0 auto;
      position: relative;

      .meizuLogo {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        color: #fff;
        text-decoration: none;
        cursor: pointer;

        i {
          font-size: 24px;
          color: #008cff !important;
        }
      }
    }

    .banner-box {
      position: relative;
      min-height: 750px;
      max-height: 1080px;
      background: linear-gradient(180deg, #edfcfd 0%, #faffff 100%);

      .bg-box {
        position: relative;
        width: 1240px;
        height: 750px;
        margin: 0 auto;

        .main-form {
          width: 298px;
          position: absolute;
          top: 16%;
          right: 85px;
          background-color: #fff;
          padding: 72px 35px 20px;
          border-radius: 2px;
          box-shadow: 0 6px 12px 0 rgba(138, 153, 150, 0.15);

          .tab-title {
            font-size: 18px;
            text-align: center;

            a.linkABlue:link,
            a.linkABlue:visited {
              color: #387aff;
              text-decoration: none;
            }

            a.linkABlue:hover {
              color: blue;
            }
          }

          .tip-box {
            position: relative;
            height: 33px;
            display: table;
            width: 100%;
            margin-bottom: 0px;
            margin-top: 26px;
            border: solid 1px #ffc2b3;
            background: #ffd1ca;
            border-radius: 2px;

            .err-ico {
              background: url("../../../public/image/error-ico.png");
              width: 16px;
              height: 16px;
              display: inline-block;
              position: absolute;
              top: 10px;
              left: 10px;
            }

            .tip-font {
              color: #666;
              font-size: 12px;
              padding-right: 25px;
              padding-left: 35px;
              display: table-cell;
              vertical-align: middle;
            }

            .close-ico {
              background: url("../../../public/image/close-ico.png");
              background-repeat: no-repeat;
              cursor: pointer;
              width: 16px;
              height: 16px;
              display: inline-block;
              position: absolute;
              top: 12px;
              right: 10px;
            }
          }

          .user,
          .phone,
          .password,
          .btn {
            margin-top: 20px;
          }

          .btn {
            display: block;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 100%;
          }

          a.login {
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
          }

          a.login:link,
          a.login:visited {
            color: #387aff;
          }

          .login:hover {
            color: cornflowerblue;
          }
        }
      }
    }

    .banner-box:before {
      position: absolute;
      content: " ";
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      margin: 0 auto;
      height: 750px;
      width: 100%;
      min-width: 1240px;
      max-width: 1920px;
      background: url("../../../public/image/pic-flyme.png") no-repeat;
      background-position: 50% 50%;
    }
  }
}
</style>
