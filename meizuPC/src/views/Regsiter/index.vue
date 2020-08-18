
<template>
  <div class="register">
    <div class="content">
      <div class="ucSimpleHeader">
        <a
          href="../../App.vue"
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
              >注册 Flyme 账号</a>
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
            <el-checkbox
              v-model="checked"
              class="agree"
            >我已阅读并同意相关协议</el-checkbox>
            <el-button
              type="primary"
              round
              class="btn"
              @click="register"
            >注册</el-button>
            <a
              href="javascript:void(0)"
              class="login"
              @click="toLogin"
            >登录</a>
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
  }),

  created() {},

  methods: {
    close() {
      this.isClose = false;
    },

    async getUser(user) {
      try {
        const data = await this.Api.shApi.getUser(user);
        console.log(data);
      } catch (error) {
        console.log("用户信息请求失败...");
      }
    },

    register() {
      if (this.input1 == "" || this.input2 == "" || this.input3 == "") {
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "您的输入有误！";
        return;
      } else if (this.checked != true) {
        alert("您还未同意相关协议！");
        return;
      }
      const user = {};
      user.uName = this.input1;
      user.uPhone = this.input2;
      user.uPwd = this.input3;
      console.log(user);
      this.getUser(user);
      alert("注册成功，快去登录吧！");
      this.$router.push("/Login");
    },

    toLogin() {
      console.log(this.$router.push("Login"));
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
         color:#008cff!important;
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
          .agree,
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

          a.login:hover {
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
