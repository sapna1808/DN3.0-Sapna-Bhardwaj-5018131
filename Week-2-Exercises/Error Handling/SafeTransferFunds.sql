CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) AS
    v_from_balance NUMBER;
    v_to_balance NUMBER;
BEGIN
    -- Start transaction
    SELECT balance INTO v_from_balance
    FROM Accounts
    WHERE account_id = p_from_account_id FOR UPDATE;

    -- Check for sufficient funds
    IF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds.');
    END IF;

    -- Update balances
    UPDATE Accounts
    SET balance = balance - p_amount
    WHERE account_id = p_from_account_id;

    UPDATE Accounts
    SET balance = balance + p_amount
    WHERE account_id = p_to_account_id;

    -- Commit transaction
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        -- Rollback transaction in case of any error
        ROLLBACK;
        -- Log the error
        INSERT INTO ErrorLog (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        -- Raise the exception again to propagate the error
        RAISE;
END;
