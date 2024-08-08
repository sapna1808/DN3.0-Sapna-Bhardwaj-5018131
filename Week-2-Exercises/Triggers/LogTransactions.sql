CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (
        transaction_id,
        account_id,
        transaction_date,
        amount,
        transaction_type,
        log_date
    ) VALUES (
        :NEW.transaction_id,
        :NEW.account_id,
        :NEW.transaction_date,
        :NEW.amount,
        :NEW.transaction_type,
        SYSDATE
    );
END LogTransaction;
/
