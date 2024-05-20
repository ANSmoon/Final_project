
SELECT * FROM users;

ALTER TABLE users ADD COLUMN regDate DATETIME;

INSERT INTO users (userId, password, userName, nickName, regDate)
VALUES ("ssafy", md5("1234"), "ssafy", "kim", now());

INSERT INTO users (userId, password, userName, nickName, regDate)
VALUES ("admin", md5("admin"), "admin", "admin", now());

DELETE FROM users
WHERE userId = "ssaf";

SELECT * FROM number;

SELECT * FROM userdata;