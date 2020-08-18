<!--
 * @Author: your name
 * @Date: 2020-08-15 09:10:29
 * @LastEditTime: 2020-08-15 11:27:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \meizuapp\src\views\Register\index.vue
-->
<template>
  <div class="register">
    <van-form class="main-form">
      <div class="logo"></div>
      <div class="tab-title">
        <a
          href="javascript:void(0)"
          class="linkABlue"
        >注册</a>
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
        name="用户名"
        label="用户名"
        placeholder="用户名"
        class="user"
        v-model="input1"
        @blur="userBlur"
      />
      <van-field
        name="手机号"
        label="手机号"
        placeholder="手机号"
        class="pho"
        v-model="input2"
        @blur="phoBlur"
      />
      <van-field
        type="password"
        name="密码"
        label="密码"
        placeholder="密码"
        class="pwd"
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
          @click="register"
        >
          注册
        </van-button>
      </div>
      <a
        href="javascript:void(0)"
        class="Login"
        @click="toLogin"
      >登录</a>
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
  }),
  created() {},
  methods: {
    // 关闭提醒窗口
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
        document.querySelector(".tip-font").innerHTML = "您的密码格式有误！";
      } else {
        this.reg[2] = true;
        this.isClose = false;
      }
    },

    // 调取注册接口
    async getUser(user) {
      try {
        const data = await this.Api.getUser(user);
        console.log(data);
      } catch (error) {
        console.log("用户信息请求失败...");
      }
    },

    // 注册
    register() {
      if (this.input1 == "" || this.input2 == "" || this.input3 == "") {
        this.isClose = true;
        document.querySelector(".tip-font").innerHTML = "还是写点东西吧，亲！";
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
      alert("注册成功，快去登录吧！");
      this.$router.push("Login");
    },

    // 登录按钮
    toLogin() {
      this.$router.push("Login");
    },
  },
};
</script>
<style lang="less">
.register {
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

    a.Login {
      margin-left: 20px;
      text-decoration: none;
      font-size: 14px;
      cursor: pointer;
    }

    a.Login:link,
    a.Login:visited {
      color: #387aff;
    }

    a.Login:hover {
      color: cornflowerblue;
    }
  }
}
</style>