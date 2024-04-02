DROP PROCEDURE IF EXISTS UNBLOCK.HIGHLIGHT_POST;

DELIMITER //

CREATE PROCEDURE UNBLOCK.HIGHLIGHT_POST(
    IN IN_HIGHLIGHT BOOLEAN,
    IN SEARCH_POST_ID INT
)
BEGIN
    UPDATE UNBLOCK.POST
    SET HIGHLIGHT = IN_HIGHLIGHT
    WHERE ID = SEARCH_POST_ID;
END//

DELIMITER ;