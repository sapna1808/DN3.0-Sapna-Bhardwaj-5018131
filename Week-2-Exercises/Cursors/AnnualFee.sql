DECLARE
    v_annual_fee CONSTANT NUMBER := 50.00;

    CURSOR ApplyAnnualFee IS
        SELECT account_id, balance
        FROM accounts;

    TYPE AccountRecord IS RECORD (
        account_id accounts.account_id%TYPE,
        balance    accounts.balance%TYPE
    );

    v_account AccountRecord;
BEGIN
    OPEN ApplyAnnualFee;

    LOOP
        FETCH ApplyAnnualFee INTO v_account;
        EXIT WHEN ApplyAnnualFee%NOTFOUND;

        UPDATE accounts
        SET balance = balance - v_annual_fee
        WHERE account_id = v_account.account_id;

        DBMS_OUTPUT.PUT_LINE('Applied annual fee to Account ID: ' || v_account.account_id);
    END LOOP;

    CLOSE ApplyAnnualFee;
    COMMIT;
END;
/
