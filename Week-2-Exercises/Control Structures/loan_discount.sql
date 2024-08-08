DECLARE
  CURSOR customer_cur IS
    SELECT c.CustomerID, l.InterestRate
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
    WHERE c.Age > 60;
  v_CustomerID Customers.CustomerID%TYPE;
  v_InterestRate Loans.InterestRate%TYPE;
BEGIN
  OPEN customer_cur;
  LOOP
    FETCH customer_cur INTO v_CustomerID, v_InterestRate;
    EXIT WHEN customer_cur%NOTFOUND;
    UPDATE Loans
    SET InterestRate = v_InterestRate * 0.99
    WHERE CustomerID = v_CustomerID;
  END LOOP;
  CLOSE customer_cur;
  COMMIT;
END;

