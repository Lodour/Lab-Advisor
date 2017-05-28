-- 用户
-- userType [0]管理员 [1]教职工 [2]学生 [3]访客
-- gender [0]女 [1]男 [2]保密
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id         INT PRIMARY KEY          AUTO_INCREMENT,
  username   CHAR(50) UNIQUE NOT NULL,
  password   CHAR(50)        NOT NULL,
  userType   INT                      DEFAULT 3,
  realName   CHAR(50)        NOT NULL,
  gender     INT             NOT NULL DEFAULT 2,
  mobile     CHAR(50),
  email      CHAR(50),
  createTime DATETIME        NOT NULL DEFAULT current_timestamp,
  lastLogin  DATETIME,
  info       TEXT
)
  DEFAULT CHARSET = utf8;
