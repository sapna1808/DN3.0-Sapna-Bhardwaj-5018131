CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    -- Update the balance of all savings accounts by applying an interest rate of 1%
    UPDATE Accounts
    SET balance = balance * 1.01
    WHERE account_type = 'Savings';
    
    -- Commit the transaction
    COMMIT;
    
    -- Log the success
    INSERT INTO Log (log_message, log_date)
    VALUES ('Monthly interest processed for all savings accounts.', SYSDATE);
EXCEPTION
    WHEN OTHERS THEN
        -- Log the error
        INSERT INTO ErrorLog (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        -- Rollback the transaction
        ROLLBACK;
        -- Raise the exception again
        RAISE;
END;
