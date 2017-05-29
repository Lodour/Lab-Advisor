DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

-- 用户
-- userType [0]管理员 [1]教职工 [2]学生 [3]访客
-- gender [0]女 [1]男 [2]保密
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id         INTEGER PRIMARY KEY          AUTO_INCREMENT,
  username   CHAR(50) UNIQUE NOT NULL,
  password   CHAR(50)        NOT NULL,
  userType   INTEGER                      DEFAULT 3,
  realName   CHAR(50)        NOT NULL,
  gender     INTEGER         NOT NULL     DEFAULT 2,
  mobile     CHAR(50),
  email      CHAR(50),
  createTime DATETIME        NOT NULL     DEFAULT current_timestamp,
  lastLogin  DATETIME,
  info       TEXT
)
  DEFAULT CHARSET = utf8;

-- 站内信
-- type 信件类型 默认为0 可用于标注特殊用途
DROP TABLE IF EXISTS mail;
CREATE TABLE mail (
  id         INTEGER  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author     INTEGER  NOT NULL REFERENCES user (id),
  sendto     INTEGER  NOT NULL REFERENCES user (id),
  createTime DATETIME NOT NULL DEFAULT current_timestamp,
  isRead     BOOLEAN  NOT NULL DEFAULT FALSE,
  content    TEXT,
  type       INTEGER  NOT NULL DEFAULT 0
)
  DEFAULT CHARSET = utf8;
