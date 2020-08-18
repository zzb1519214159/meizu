import Cart from '../../views/Cart/index.vue'
import ProductInfo from '../../views/Product-info/index.vue'

const dtRoutes = [
  {
    path: '/Cart',
    component: Cart,
    meta: {
      isshow: true,
      hehow: true
     }
  },
  {
    path: '/Product-info/:id',
    component: ProductInfo
  },
 
]

export default dtRoutes