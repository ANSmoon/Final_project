<template>
  <main :class="selectedNation">
    <div class="container">
      <h1>다함께 SHOW SHOW SHOW!</h1>
      <h3>당신은 풀 수 있다 퀴즈를...</h3>
      | <router-link to="/rank" class="nav-link">RANK</router-link> |
      <router-link to="/arena" class="nav-link">ARENA</router-link> |
    </div>

    <div class="thumbnails-container">
      <div v-for="(thumbnail, index) in thumbnails" :key="index">
        <button @click="startQuiz(index)">
          <div class="thumbnail">
            <img :src="thumbnail.image" :alt="thumbnail.alt" />
            <h2 class="start-heading">START</h2>
          </div>
        </button>
      </div>
    </div>
    <!-- 모달 -->
    <div class="modal" v-if="openModal">
      <div class="modal-content">
        <!-- x 버튼을 클릭했을 때 closeModalWithoutSaving 함수 호출 -->
        <span class="close" @click="closeModal">&times;</span>
        <h2 class="modal-title">레쓰고</h2>
        <div class="info-details">
          <h3>게임 안내</h3>
          <div>
            <ul>
              <li>START를 누르면 바로 게임이 시작</li>
              <li>총 10개의 문제가 준비되어있습니다</li>
              <li>아무것도 입력하지 않으면 넘어갈 수 없다</li>
              <li>문제 당 10초의 제한이 있으니 시간초과에 유의하도록</li>
              <li>퀴즈 종료 후 데이터 저장 가능합니다</li>
              <li>모든 카테고리에서 top을 차지하세요</li>
            </ul>
          </div>
          <hr />
          <div>
            <p><h1>개발자와의 심리전에서 이겨보든가ㅎ</h1></p>
          </div>
        </div>
        <div class="modal-buttons">
          <button @click="startGame()" class="start-button">놀아보자고</button>
        </div>
      </div>
    </div>
  </main>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router"; // Vue Router 추가

const selectedNation = ref("");

const router = useRouter(); // Vue Router 사용

const thumbnails = [
  { image: "@/assets/tmp/tmp1.jpg", alt: "E-SPORTS", category: "esports" },
  { image: "@/assets/tmp/tmp1.jpg", alt: "KBO", category: "kbo" },
  { image: "@/assets/tmp/tmp1.jpg", alt: "K-LEAGUE", category: "kleague" },
  { image: "@/assets/tmp/tmp1.jpg", alt: "해외축구", category: "champs" },
  { image: "@/assets/tmp/tmp1.jpg", alt: "MIX", category: "basic  " },
  // 다른 썸네일 정보도 추가할 수 있습니다.
];

const openModal = ref(false);
const gameIndex = ref(0);

const startQuiz = (index) => {
  openModal.value = true;
  gameIndex.value = index;
  // router.push(`/game/${thumbnail.category}`);
};

const closeModal = function () {
  openModal.value = false;
  router.push({ name: "home" });
};

const startGame = function () {
  openModal.value = false;
  console.log(gameIndex.value);
  console.log(thumbnails[gameIndex.value].category);
  router.push(`/game/${thumbnails[gameIndex.value].category}`);
};
</script>

<style scoped>
.container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px;
  background-color: #272727;
  color: #fff;
}

/* 각 국가별 스타일 */
main.korea {
  background-color: #c60c30;
}

main.japan {
  background-color: #ffffff;
}

main.china {
  background-color: #de2910;
}

main.northkorea {
  background-color: #024fa2;
}

main.usa {
  background-color: #3c3b6e;
}

main.uk {
  background-color: #00247d;
}

.thumbnails-container {
  margin-top: 20px;
  text-align: center;
}

h1 {
  font-size: 24px;
  margin: 0;
}

h2 {
  font-size: 20px;
  margin: 10px 0 0;
}

.nav-link {
  text-decoration: none;
  color: #fff;
  margin-right: 10px;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #007bff;
}

.thumbnail {
  display: inline-block;
  background-color: aquamarine;
  margin-right: 10px;
  cursor: pointer;
}

.thumbnail img {
  width: 200px;
  height: auto;
}

.start-heading {
  margin-top: 5px;
}

.thumbnail-link {
  text-decoration: none;
}

.thumbnail:hover {
  background-color: whitesmoke;
}

/* 모달 스타일 */
.modal {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 20px;
  border-radius: 10px; /* 둥근 테두리 추가 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
  z-index: 1000;
}

.close {
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 1.5rem;
  cursor: pointer;
  color: #aaa;
}

.close:hover {
  color: #666;
}

.modal-content {
  width: 600px; /* 모달 너비 조정 */
  height: 600px;
}

.modal-title {
  margin-bottom: 20px;
  font-size: 1.5rem;
}

.info-details {
  margin-bottom: 20px;
}

.info-details p {
  font-size: 1.2rem;
  margin-bottom: 10px;
}

.modal-buttons {
  display: flex;
  justify-content: center;
  align-items: center;
}

.start-button {
  background-color: #4caf50;
  color: white;
}

.start-button {
  padding: 10px 20px;
  margin: 0 10px;
  font-size: 1rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.start-button:hover {
  opacity: 0.8; /* 버튼에 호버 효과 추가 */
}
</style>
