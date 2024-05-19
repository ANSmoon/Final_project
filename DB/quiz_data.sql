
SELECT * FROM users;

ALTER TABLE users ADD COLUMN regDate DATETIME;

INSERT INTO users (userId, password, userName, nickName, regDate)
VALUES ("ssaf", md5("1234"), "ssafy", "kim", now());

DELETE FROM users
WHERE id = "ssafy";


SELECT * FROM userdata;