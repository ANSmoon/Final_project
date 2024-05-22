<template>
  <div>
    <h2>ARENA DETAIL</h2>
    <hr />
    <div>{{ arenaStore.arena.field }}</div>
    <div>{{ arenaStore.arena.starter }}</div>
    <div>{{ arenaStore.arena.openDay }}</div>
    <div>{{ arenaStore.arena.interest }}</div>
    <div>{{ arenaStore.arena.content }}</div>

    <button @click="deleteArena" v-if="userCheck">삭제</button>
    <button @click="updateArena" v-if="userCheck">수정</button>

    <div>
      <h4>FIGHT</h4>
      <FightList />
    </div>
  </div>
</template>

<script setup>
import FightList from "@/components/fight/FightList.vue";
import { useArenaStore } from "@/stores/arena";
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";

const arenaStore = useArenaStore();
const route = useRoute();
const router = useRouter();
const loginUser = sessionStorage.getItem("user");
const userCheck = ref(true);

const deleteArena = async () => {
  await arenaStore.deleteArena(route.params.arenaId);
  router.push({ name: "arenaList" });
};

const updateArena = function () {
  router.push({
    name: "updateArena",
    query: {
      arenaId: route.params.arenaId,
    },
  });
};

onMounted(async () => {
  if (!sessionStorage.getItem("visitFlag" + route.params.arenaId)) {
    sessionStorage.setItem("visitFlag" + route.params.arenaId, true);
    await arenaStore.updateInterest(route.params.arenaId, 1);
  }
  await arenaStore.getArenaNow(route.params.arenaId);
  if (arenaStore.arena === "") {
    router.push({ name: "arenaList" });
  }
  if (loginUser !== arenaStore.arena.starter) {
    userCheck.value = false;
  } else {
    userCheck.value = true;
  }
});
</script>

<style scoped>
button {
  border: 1px solid black;
  margin-right: 5px;
}
</style>
