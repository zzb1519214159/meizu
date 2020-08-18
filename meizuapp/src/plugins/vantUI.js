import Vue from 'vue'
import {
  Toast,
  NavBar,
  Tabbar, TabbarItem,
  Swipe, SwipeItem,
  Grid, GridItem,
  Card,Button,Tab, Tabs,
  NoticeBar,Col,Row,
  Icon,Tag,Lazyload,Sku,
  GoodsAction,GoodsActionButton,
  GoodsActionIcon,Form,Field,
  SubmitBar,Stepper
} from 'vant'
import { Image as VanImage } from 'vant';
Vue
  .use(NavBar)
  .use(Tabbar).use(TabbarItem)
  .use(Swipe).use(SwipeItem)
  .use(Grid).use(GridItem)
  .use(Card)
  .use(Button)
  .use(Tab)
  .use(Tabs)
  .use(NoticeBar)
  .use(Col).use(Row)
  .use(VanImage)
  .use(Icon)
  .use(Tag)
  .use(Lazyload)
  .use(Sku)
  .use(GoodsAction)
  .use(GoodsActionButton)
  .use(GoodsActionIcon)
  .use(Form)
  .use(Field)
  .use(SubmitBar)
  .use(Stepper)
Vue.prototype.$Toast = Toast
