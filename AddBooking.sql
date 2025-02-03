-- Delete the procedure if it exists
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(booking_date DATE, table_number INT, staff_id INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Error handling
        ROLLBACK;
        SELECT 'Error occurred, transaction rolled back' AS 'Error';
    END;
    
    -- Begin the transaction
    START TRANSACTION;

    -- Insert data into the bookings table
    INSERT INTO bookings (BookingDate, TableNumber, StaffID)
    VALUES (booking_date, table_number, staff_id);

    -- Commit the changes
    COMMIT;

    -- Confirmation of new booking addition
    SELECT 'New booking added' AS 'Confirmation';
END //

DELIMITER ;
