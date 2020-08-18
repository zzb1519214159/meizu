import Community from '../../views/Community/index.vue'
import Flyme from '../../views/Flyme/index.vue'
const dtRoutes = [
    {
        path: '/Community',
        component: Community,
        meta: {
            isshow: true,
            hehow: true
        }
    },
    {
        path: '/Flyme',
        component: Flyme
    },

]

export default dtRoutes