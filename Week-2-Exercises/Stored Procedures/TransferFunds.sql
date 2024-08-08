CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) AS
    v_from_balance NUMBER;
BEGIN
    -- Start a transaction
    BEGIN
        -- Lock the source account for update
        SELECT balance INTO v_from_balance
        FROM Accounts
        WHERE account_id = p_from_account_id FOR UPDATE;

        -- Check if the source account has sufficient balance
        IF v_from_balance < p_amount THEN
            RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
        END IF;

        -- Update the source account balance
        UPDATE Accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account_id;

        -- Update the destination account balance
        UPDATE Accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account_id;

        -- Commit the transaction
        COMMIT;

        -- Log the success
        INSERT INTO Log (log_message, log_date)
        VALUES ('Transferred ' || p_amount || ' from account ID ' || p_from_account_id || ' to account ID ' || p_to_account_id, SYSDATE);
    EXCEPTION
        WHEN OTHERS THEN
            -- Rollback the transaction in case of any error
            ROLLBACK;
            -- Log the error
            INSERT INTO ErrorLog (error_message, error_date)
            VALUES (SQLERRM, SYSDATE);
            -- Raise the exception again
            RAISE;
    END;
END;
