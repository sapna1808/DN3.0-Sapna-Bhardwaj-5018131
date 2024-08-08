DECLARE
    CURSOR GenerateMonthlyStatements IS
        SELECT customer_id, transaction_date, transaction_amount, transaction_type
        FROM transactions
        WHERE transaction_date BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE);
    
    TYPE TransactionRecord IS RECORD (
        customer_id        transactions.customer_id%TYPE,
        transaction_date   transactions.transaction_date%TYPE,
        transaction_amount transactions.transaction_amount%TYPE,
        transaction_type   transactions.transaction_type%TYPE
    );

    v_transaction TransactionRecord;
BEGIN
    OPEN GenerateMonthlyStatements;

    LOOP
        FETCH GenerateMonthlyStatements INTO v_transaction;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_transaction.customer_id);
        DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || v_transaction.transaction_date);
        DBMS_OUTPUT.PUT_LINE('Transaction Amount: ' || v_transaction.transaction_amount);
        DBMS_OUTPUT.PUT_LINE('Transaction Type: ' || v_transaction.transaction_type);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;

    CLOSE GenerateMonthlyStatements;
END;
/
