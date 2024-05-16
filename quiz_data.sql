INSERT INTO country (question, answer)
VALUES ("올림픽 성화는 어느 나라에서 채화되어 개최지 올림픽 경기장으로 운반되는 것일까요?", "그리스");

INSERT INTO country (question, answer)
VALUES ("크로스컨트리 스키와 스키점프를 함께 치르는 노르딕 복합은 어느 나라에서 유래한 스포츠일까요?", "노르웨이");

INSERT INTO country (question, answer)
VALUES ("실내종합경기장인 '매디슨 스퀘어 가든'이 위치한 곳은?", "뉴욕");

INSERT INTO country (question, answer)
VALUES ("리그오브레전드라는 게임의 대회에서 가장 많이 우승한 팀의 국가는?", "대한민국");

INSERT INTO country (question, answer)
VALUES ("길거리 농구의 발상지로 알려진 나라는?", "미국");

SELECT * FROM country;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO etc (question, answer)
VALUES ("포켓볼 게임에서 8번 공은 무슨 색일까요?", "검은색");

INSERT INTO etc (question, answer)
VALUES ("야구공의 중심부는 무엇으로 구성되어 있을까요?", "고무코르크");

INSERT INTO etc (question, answer)
VALUES ("구기종목에서 한 선수가 발이나 손을 이용해 공을 몰고 가는 기술을 무엇이라고 할까요?", "드리블");

INSERT INTO etc (question, answer)
VALUES ("씨름에서 가장 '무거운' 체급은?", "백두");

INSERT INTO etc (question, answer)
VALUES ("권투에서 상대편의 턱을 밑에서 위로 올려 치는 공격법은?", "어퍼컷");

SELECT * FROM etc;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO exercise (question, answer)
VALUES ("트리플 크라운'이라는 용어는 원래 미국의 어느 스포츠 경기에서 유래하였을까요?", "경마");

INSERT INTO exercise (question, answer)
VALUES ("고무보트를 타고 계곡의 급류를 헤쳐나가는 레포츠의 이름은?", "래프팅");

INSERT INTO exercise (question, answer)
VALUES ("네트를 중앙에 두고 라켓으로 셔틀콕(깃털공)을 쳐서 네트를 넘기는 경기의 이름은?", "배드민턴");

INSERT INTO exercise (question, answer)
VALUES ("경기 전 몸무게를 재야하는 스포츠는?", "복싱");

INSERT INTO exercise (question, answer)
VALUES ("볼더링'은 어떤 스포츠 경기의 세부 종목일까요?", "스포츠클라이밍");

SELECT * FROM exercise;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO person (question, answer)
VALUES ("`나비처럼 날아서 벌처럼 쏜다`라는 유명한 말을 남긴 사람은?", "무하마드알리");

INSERT INTO person (question, answer)
VALUES ("유일하게 두 개의 다른 체급에서 올림픽과 세계선수권을 모두 우승한 선수는?", "심권호");

INSERT INTO person (question, answer)
VALUES ("필라테스' 운동을 처음 고안한 사람은 누구일까요?", "요제프 필라테스");

INSERT INTO person (question, answer)
VALUES ("인간 탄환이라는 별명과 함께 남자 100m, 200m 세계 기록을 보유한 자메이카 출신의 육상 단거리 선수는?", "우사인 볼트");

INSERT INTO person (question, answer)
VALUES ("2022 월드컵 대한민국:가나전에서 2골을 넣은 축구선수는 누구일까요?", "조규성");

SELECT * FROM person;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO number (question, answer)
VALUES ("`Welcome home`이라는 슬로건을 내걸었던 아테네 올림픽의 개최년도는?", "2004");

INSERT INTO number (question, answer)
VALUES ("농구에서 3점슛 라인까지의 거리는?", "6.75");

INSERT INTO number (question, answer)
VALUES ("축구에서 페널티 지점까지의 거리는?", "11");

INSERT INTO number (question, answer)
VALUES ("셔틀콕에는 몇 개의 깃털이 고정되어 있을까요?", "16");

INSERT INTO number (question, answer)
VALUES ("올림픽 양궁에서 과녁의 가장 바깥쪽의 백색 고리 부분에 득점할 경우 몇 점을 획득하는가?", "1");

SELECT * FROM number;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

SELECT * FROM userscountry;

ALTER TABLE users ADD COLUMN regDate DATETIME;

INSERT INTO users (id, password, username, nickname, regDate)
VALUES ("ssafy", md5("1234"), "ssafy", "kim", now());

DELETE FROM users
WHERE id = "ssafy";


SELECT * FROM userdata;