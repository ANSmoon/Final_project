import { ref } from "vue";
import { defineStore } from "pinia";
import axios from "axios";
const apiKey = import.meta.env.VITE_KAKAO_API_KEY;

export const useKakaoStore = defineStore("kakao", () => {
  const question = "판다가 뭐야?";
  const hint = ref("");

  const getHint = function () {
    axios
      .post(
        "/api/v1/inference/kogpt/generation",
        {
          prompt: question,
          max_tokens: 50,
          temperature: 1.0,
          n: 1,
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `KakaoAK ${apiKey}`,
          },
        }
      )
      .then((response) => {
        console.log(response.data.generations[0].text);
        hint.value = response.data.generations[0].text.split(".")[1];
      });
  };

  return { hint, getHint };
});
