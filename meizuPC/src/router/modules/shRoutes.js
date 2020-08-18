import Login from '../../views/Login/index.vue'
import Regsiter from '../../views/Regsiter/index.vue'

const dtRoutes = [
    {
        path: '/Login',
        component: Login,
        meta: {
            isshow: true,
            hehow: true
        }
    },
    {
        path: '/Regsiter',
        component: Regsiter,
        meta: {
            isshow: true,
            hehow: true
        }
    }
]

export default dtRoutes