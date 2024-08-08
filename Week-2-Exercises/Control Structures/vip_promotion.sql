DECLARE
  CURSOR balance_cur IS
    SELECT CustomerID
    FROM Accounts
    WHERE Balance > 10000;
  v_CustomerID Accounts.CustomerID%TYPE;
BEGIN
  OPEN balance_cur;
  LOOP
    FETCH balance_cur INTO v_CustomerID;
    EXIT WHEN balance_cur%NOTFOUND;
    UPDATE Customers
    SET IsVIP = 'TRUE'
    WHERE CustomerID = v_CustomerID;
  END LOOP;
  CLOSE balance_cur;
  COMMIT;
END;

