import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            name: "Home",
            path: "/",
            component: () => import('@/views/Home.vue')
        }
    ]
});

export default router;