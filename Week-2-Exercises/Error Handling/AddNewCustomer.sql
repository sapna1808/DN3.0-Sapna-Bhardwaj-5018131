CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_email IN VARCHAR2
) AS
BEGIN
    BEGIN
        -- Attempt to insert the new customer
        INSERT INTO Customers (customer_id, name, email)
        VALUES (p_customer_id, p_name, p_email);

        -- Commit transaction
        COMMIT;

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            -- Handle the error if customer ID already exists
            INSERT INTO ErrorLog (error_message, error_date)
            VALUES ('Customer ID already exists: ' || p_customer_id, SYSDATE);
            -- Rollback transaction to prevent duplicate data
            ROLLBACK;
            -- Raise the exception again to propagate the error
            RAISE;
        WHEN OTHERS THEN
            -- Log any other errors
            INSERT INTO ErrorLog (error_message, error_date)
            VALUES (SQLERRM, SYSDATE);
            -- Rollback transaction
            ROLLBACK;
            -- Raise the exception again to propagate the error
            RAISE;
    END;
END;
