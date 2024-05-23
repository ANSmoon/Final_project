import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import LoginView from "@/views/LoginView.vue";
import RegistView from "@/views/RegistView.vue";
import AdminView from "@/views/AdminView.vue";
import RankView from "@/views/RankView.vue";
import GameView from "@/views/GameView.vue";
import KakaoView from "@/views/KakaoView.vue";
import ArenaView from "@/views/ArenaView.vue";
import ArenaList from "@/components/arena/ArenaList.vue";
import ArenaDetail from "@/components/arena/ArenaDetail.vue";
import ArenaCreate from "@/components/arena/ArenaCreate.vue";
import ArenaUpdate from "@/components/arena/ArenaUpdate.vue";
import FightList from "@/components/fight/FightList.vue";
import { ref } from "vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
    },
    {
      path: "/login",
      name: "login",
      component: LoginView,
    },
    {
      path: "/regist",
      name: "regist",
      component: RegistView,
    },
    {
      path: "/admin",
      name: "admin",
      component: AdminView,
    },
    {
      path: "/game/:category",
      name: "game",
      component: GameView,
    },
    {
      path: "/rank",
      name: "rank",
      component: RankView,
    },
    {
      path: "/arena",
      name: "arena",
      component: ArenaView,
      children: [
        {
          path: "",
          name: "arenaList",
          component: ArenaList,
        },
        {
          path: "detail/:arenaId",
          name: "arenaDetail",
          component: ArenaDetail,
          children: [
            {
              path: "",
              name: "fight",
              component: FightList,
            },
          ],
        },
        {
          path: "create",
          name: "createArena",
          component: ArenaCreate,
        },
        {
          path: "update",
          name: "updateArena",
          component: ArenaUpdate,
        },
      ],
    },
    {
      path: "/kakao",
      name: "kakao",
      component: KakaoView,
    },
  ],
});

router.beforeEach((to, from) => {
  const user = ref(sessionStorage.getItem("user"));

  if (user.value && (to.name === "login") | (to.name === "regist")) {
    return { name: "home" };
  }

  if (user.value !== "admin" && to.name === "admin") {
    return { name: "home" };
  }

  if (!user.value && to.name === "fight") {
    return { name: "arenaList" };
  }

  if (!user.value && to.name === "game") {
    return { name: "home" };
  }

  if (!user.value && to.name === "createArena") {
    return { name: "arenaList" };
  }
});

export default router;
