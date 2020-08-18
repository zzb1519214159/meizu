<template>
  <div class="footer" v-show="!$route.meta.fot">
    <div class="footer-contact-wp">
      <van-row
        type="flex"
        justify="center"
        class="footer-con"
      >
        <van-col span="11">
          <van-button type="info">
            <van-icon
              name="phone"
              color="#fff"
            />
            400-788-3333
          </van-button>
        </van-col>
        <van-col span="11">
          <van-button type="info">
            <van-icon
              name="chat"
              color="#fff"
            />
            在线客服
          </van-button>
        </van-col>
      </van-row>
      <div class="footer-title">
        <p>粤ICP备13003602号-2合字B2-20170010</p>
        <p>营业执照©2018 Meizu All rights reserved</p>
      </div>

    </div>
  </div>
</template>
<script>
export default {
  data: () => ({}),
  created () {},
  methods: {},
};
</script>
<style lang="less" scoped>
.footer{
  width: 100%;
.footer-con{
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
 
.van-button--normal{
    width: 100%;
    height: 30px;
    font-size: 12px;
    border-radius: 20px;
    }
   
    
}
 .footer-title{
     width: 80%;
     margin: 0 auto;
     text-align: center;
        p{
        font-size: 12px;
        color: #999;
        }
    }
}

</style>