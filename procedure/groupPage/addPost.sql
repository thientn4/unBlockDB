DROP PROCEDURE IF EXISTS UNBLOCK.ADD_POST;

DELIMITER //

CREATE PROCEDURE UNBLOCK.ADD_POST(
    IN IN_GROUP_ID INT,
    IN IN_OP_EMAIL TEXT,
    IN IN_COMMENT_TO INT,
    IN IN_REPLY_TO INT,
    IN IN_TITLE TEXT,
    IN IN_CONTENT TEXT,
    IN IN_IS_PRIVATE BOOLEAN,
    IN IN_HIGHLIGHT BOOLEAN
)
BEGIN
    INSERT INTO UNBLOCK.POST (
        GROUP_ID,
        OP_EMAIL,
        COMMENT_TO,
        REPLY_TO,
        TITLE,
        CONTENT,
        IS_PRIVATE,
        HIGHLIGHT,
        TIME_STAMP
    )
    VALUES
    (
        IN_GROUP_ID,
        IN_OP_EMAIL,
        IN_COMMENT_TO,
        IN_REPLY_TO,
        IN_TITLE,
        IN_CONTENT,
        IN_IS_PRIVATE,
        IN_HIGHLIGHT,
        NOW()
    );
    SELECT LAST_INSERT_ID() AS ID;
END//

DELIMITER ;