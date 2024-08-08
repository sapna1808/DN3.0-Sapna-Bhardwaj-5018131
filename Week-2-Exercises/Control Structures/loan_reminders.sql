DECLARE
  CURSOR due_loans_cur IS
    SELECT l.CustomerID, c.Name, l.DueDate
    FROM Loans l
    JOIN Customers c ON l.CustomerID = c.CustomerID
    WHERE l.DueDate BETWEEN SYSDATE AND SYSDATE + 30;
  v_CustomerID Customers.CustomerID%TYPE;
  v_Name Customers.Name%TYPE;
  v_DueDate Loans.DueDate%TYPE;
BEGIN
  OPEN due_loans_cur;
  LOOP
    FETCH due_loans_cur INTO v_CustomerID, v_Name, v_DueDate;
    EXIT WHEN due_loans_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Reminder: Customer ' || v_Name || ' (ID: ' || v_CustomerID || '), your loan is due on ' || TO_CHAR(v_DueDate, 'DD-MON-YYYY') || '.');
  END LOOP;
  CLOSE due_loans_cur;
END;

