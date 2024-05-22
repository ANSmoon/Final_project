<template>
  <div>
    <h2>ARENA LIST</h2>
    <hr />
    <table>
      <tr>
        <th>번호</th>
        <th>경기장</th>
        <th>주최자</th>
        <th>관심</th>
        <th>개최일</th>
      </tr>
      <tr v-for="(arena, index) in arenaStore.arenaList" :key="arena.id">
        <td>{{ index + 1 }}</td>
        <td>
          <RouterLink :to="`/arena/detail/${arena.arenaId}`">{{
            arena.field
          }}</RouterLink>
        </td>
        <td>{{ arena.starter }}</td>
        <td>{{ arena.interest }}</td>
        <td>{{ arena.openDay }}</td>
      </tr>
    </table>
    <RouterLink :to="`/arena/create`">Arena 등록</RouterLink>
  </div>
</template>

<script setup>
import { useArenaStore } from "@/stores/arena";
import { ref, onMounted } from "vue";

const arenaStore = useArenaStore();

onMounted(() => {
  arenaStore.getArenaList();
});
</script>

<style scoped></style>
