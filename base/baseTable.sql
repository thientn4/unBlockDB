------------- DROP EXISTING TABLES -----------------
DROP SCHEMA IF EXISTS UNBLOCK;


--------------- CREATE BASE TABLES -----------------
CREATE SCHEMA UNBLOCK;
CREATE TABLE UNBLOCK.GROUP(
    ID VARCHAR(100),
    NAME TEXT,
    OWNER_EMAIL TEXT,
    PRIMARY KEY(ID)
);
CREATE TABLE UNBLOCK.POST(
    ID INT AUTO_INCREMENT,
    GROUP_ID VARCHAR(100),
    OP_EMAIL TEXT,
    COMMENT_TO INT,
    REPLY_TO INT,
    TITLE TEXT,
    CONTENT TEXT,
    IS_PRIVATE BOOLEAN,
    HIGHLIGHT BOOLEAN,
    TIME_STAMP DATETIME,
    PRIMARY KEY(ID)
);
CREATE TABLE UNBLOCK.MEMBERSHIP(
    USER_EMAIL VARCHAR(30),
    GROUP_ID VARCHAR(100),
    IS_ADMIN BOOLEAN,
    PRIMARY KEY(USER_EMAIL,GROUP_ID)
);
CREATE TABLE UNBLOCK.GROUP_TAG(
    GROUP_ID VARCHAR(100),
    TAG VARCHAR(30),
    PRIMARY KEY(TAG,GROUP_ID)
);
CREATE TABLE UNBLOCK.POST_TAG(
    POST_ID INT,
    TAG VARCHAR(30),
    PRIMARY KEY(TAG,POST_ID)
);