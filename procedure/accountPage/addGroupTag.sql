DROP PROCEDURE IF EXISTS UNBLOCK.ADD_GROUP_TAG;

DELIMITER //

CREATE PROCEDURE UNBLOCK.ADD_GROUP_TAG(
    IN IN_TAG TEXT,
    IN IN_GROUP_ID INT
)
BEGIN
    INSERT INTO UNBLOCK.GROUP_TAG (
        GROUP_ID,
        TAG
    )
    VALUES
    (
        IN_GROUP_ID,
        IN_TAG
    );
END//

DELIMITER ;