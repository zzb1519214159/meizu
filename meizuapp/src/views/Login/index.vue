<template>
  <div class="login">
    <van-form
      @submit="login()"
      class="main-form"
    >
      <div class="logo"></div>
      <div class="tab-title">
        <a
          href="javascript:void(0)"
          class="linkABlue"
        >登录</a>
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
      <van-field
        class="user"
        placeholder="请输入用户名"
        label="用户名"
        v-model="input1"
        @blur="userBlur"
      />
      <van-field
        class="pho"
        placeholder="请输入手机号"
        label="手机号"
        v-model="input2"
        @blur="phoBlur"
      />
      <van-field
        class="pwd"
        placeholder="请输入密码"
        label="密码"
        type="password"
        v-model="input3"
        @blur="pwdBlur"
      />
      <div style="margin: 16px;">
        <van-button
          round
          block
          type="info"
          native-type="submit"
          class="btn"
          @click="login"
        >
          登录
        </van-button>
      </div>
      <a
        href="javascript:void(0)"
        class="Register"
        @click="toRegister"
      >注册</a>
    </van-form>
  </div>
</template>
<script>
export default {
  data: () => ({
    input1: "",
    input2: "",
    input3: "",
    isClose: false,
    reg: [true, true, true],
    userInfo: {},
    id: "",
  }),

  created() {},

  methods: {
    // 关闭提示窗口
    close() {
      this.isClose = false;
    },

    // 检测用户名
    userBlur() {
      let userCheck = /^[a-zA-Z0-9_-]{4,16}$/;
      console.log(userCheck.test(this.input1));
      if (userCheck.test(this.input1) == false) {
        this.reg[0] = false;
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "您的用户名输入有误！";
      } else {
        this.reg[0] = true;
        this.isClose = false;
      }
    },

    // 检测手机号
    phoBlur() {
      let phoCheck = /^(?:(?:\+|00)86)?1[3-9]\d{9}$/;
      console.log(phoCheck.test(this.input2));
      if (phoCheck.test(this.input2) == false) {
        this.reg[1] = false;
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "您的手机号输入有误！";
      } else {
        this.reg[1] = true;
        this.isClose = false;
      }
    },

    // 检测密码
    pwdBlur() {
      let pwdCheck = /^\S*(?=\S{6,})(?=\S*\d)(?=\S*[a-z])\S*$/;
      console.log(pwdCheck.test(this.input3));
      if (pwdCheck.test(this.input3) == false) {
        this.reg[2] = false;
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "您的密码输入有误！";
      } else {
        this.reg[2] = true;
        this.isClose = false;
      }
    },

    // 注册按钮
    toRegister() {
      this.$router.push("/Register");
    },

    // 登录接口
    async getInfo(info) {
      try {
        const data = await this.Api.getInfo(info);
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
          this.getcartgoods();
        }
      } catch (error) {
        console.log("用户信息请求失败...");
      }
    },

    // 登录
    login() {
      if (this.input1 == "" || this.input2 == "" || this.input3 == "") {
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "别为空哦，亲！";
        return;
      }
      if (
        this.reg.some((ele) => {
          if (ele == false) {
            return true;
          }
        })
      ) {
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

    // 购物车接口
    async getcartgoods() {
      if (localStorage.getItem("userInfo")) {
        let nid = this.userInfo.uId;
        this.username = this.userInfo.name;
        try {
          const {
            data: { message },
          } = await this.Api.getcartgoods(nid);
          this.$store.state.pjStore.cartsList = message;
        } catch (error) {
          console.log("商品详情请求失败" + error.message);
        }
      }
    },
  },
};
</script>
<style lang="less">
.login {
  width: 100%;
  height: 100vh;
  padding: 10px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  .main-form {
    position: absolute;
    top: 0;

    .logo {
      width: 110px;
      height: 50px;
      margin: 0 auto;
      margin-top: 30px;
      background: url("../../assets/image/logo.png") no-repeat;
      background-size: contain;
    }

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
        background: url("../../assets/image/error-ico.png");
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
        background: url("../../assets/image/close-ico.png");
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
    .pho,
    .pwd,
    .btn {
      margin-top: 30px;
    }

    a.Register {
      margin-left: 20px;
      text-decoration: none;
      font-size: 14px;
      cursor: pointer;
    }

    a.Register:link,
    a.Register:visited {
      color: #387aff;
    }

    a.Register:hover {
      color: cornflowerblue;
    }
  }
}
</style>