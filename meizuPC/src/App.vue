<template>
  <div>
    <Header></Header>
    <router-view>

  </router-view>
  <Footer></Footer>
  </div>
 
</template>
<script>
import Header from './components/Header/index.vue'
import Footer from './components/Footer/index.vue'
export default {
  data: () => ({}),
  created () {
  this.getcartgoods()
  },
  methods: {
    async getcartgoods() {
      if(localStorage.getItem('userInfo')==undefined) return
    
      if(localStorage.getItem('userInfo')){
        let nid = JSON.parse(localStorage.getItem('userInfo')).uId
        try {
        const {
          data: { message },
        } = await this.Api.pjApi.getcartgoods(nid);
        this.$store.state.pjStore.cartsList= message;
        console.log(this.$store.state.pjStore.cartsList)
      } catch (error) {
        console.log("商品详情请求失败" + error.message);
      }
      }
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
  },
 
  components:{
    Header,
    Footer
  },
 
};
</script>
<style>
</style>