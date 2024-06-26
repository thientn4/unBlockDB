DROP PROCEDURE IF EXISTS UNBLOCK.EDIT_GROUP;

DELIMITER //

CREATE PROCEDURE UNBLOCK.EDIT_GROUP(
    IN NEW_NAME TEXT,
    IN SEARCH_GROUP_ID INT,
    IN IN_OWNER_EMAIL TEXT
)
BEGIN
    UPDATE UNBLOCK.GROUP
    SET NAME = NEW_NAME
    WHERE ID = SEARCH_GROUP_ID AND OWNER_EMAIL = IN_OWNER_EMAIL;
    
    DELETE FROM UNBLOCK.GROUP_TAG WHERE GROUP_ID=SEARCH_GROUP_ID AND EXISTS (SELECT * FROM UNBLOCK.GROUP WHERE ID = SEARCH_GROUP_ID AND OWNER_EMAIL = IN_OWNER_EMAIL);
    -- PROCEDURE ONLY RETURN # OF ROWS CHANGED FOR THE LAST QUERY
    DELETE FROM UNBLOCK.MEMBERSHIP WHERE GROUP_ID=SEARCH_GROUP_ID AND EXISTS (SELECT * FROM UNBLOCK.GROUP WHERE ID = SEARCH_GROUP_ID AND OWNER_EMAIL = IN_OWNER_EMAIL);
END//

DELIMITER ;