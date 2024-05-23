<template>
  <div>
    <h2>ARENA UPDATE</h2>
    <hr />
    <fieldset>
      <legend>GIVE ME A FIGHT</legend>
      <div>
        <label for="field">FIELD : </label>
        <input type="text" id="title" v-model="arena.field" />
      </div>
      <div>
        <label for="starter">개최자 : </label>
        {{ arena.starter }}
      </div>
      <div>
        <label for="content">내용 : </label>
        <textarea
          id="content"
          cols="30"
          rows="10"
          v-model="arena.content"
        ></textarea>
      </div>
      <div>
        <button @click="updateArena">수정</button>
      </div>
    </fieldset>
  </div>
</template>

<script setup>
import { useArenaStore } from "@/stores/arena";
import { ref, onMounted } from "vue";
import { useRoute, useRouter } from "vue-router";

const arenaStore = useArenaStore();
const route = useRoute();
const router = useRouter();

const arena = ref({});

const updateArena = async () => {
  if (arena.value.field === "") {
    alert("제목을 입력해주세요");
  } else {
    await arenaStore.updateArena(arena.value);
    router.push({ name: "arenaList" });
  }
};

onMounted(async () => {
  await arenaStore.getArenaNow(route.query.arenaId);
  arena.value = arenaStore.arena;
});
</script>

<script>
import { defineComponent } from "vue";

export default defineComponent({
  beforeRouteEnter(to, from, next) {
    const loginUser = sessionStorage.getItem("user");
    const arenaStore = useArenaStore();

    arenaStore.getArenaNow(to.query.arenaId).then(() => {
      if (loginUser !== arenaStore.arena.starter) {
        next({ name: "arenaList" });
      } else {
        next();
      }
    });
  },
});
</script>

<style scoped>
input,
textarea {
  border: 1px solid black;
}
</style>
