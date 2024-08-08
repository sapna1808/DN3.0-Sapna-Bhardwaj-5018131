CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(
        p_customer_id    IN NUMBER,
        p_name           IN VARCHAR2,
        p_address        IN VARCHAR2,
        p_phone          IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Customers (customer_id, name, address, phone)
        VALUES (p_customer_id, p_name, p_address, p_phone);
    END AddCustomer;

    PROCEDURE UpdateCustomer(
        p_customer_id    IN NUMBER,
        p_name           IN VARCHAR2,
        p_address        IN VARCHAR2,
        p_phone          IN VARCHAR2
    ) IS
    BEGIN
        UPDATE Customers
        SET name = p_name, address = p_address, phone = p_phone
        WHERE customer_id = p_customer_id;
    END UpdateCustomer;

    FUNCTION GetCustomerBalance(
        p_customer_id    IN NUMBER
    ) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT SUM(balance)
        INTO v_balance
        FROM Accounts
        WHERE customer_id = p_customer_id;
        
        RETURN v_balance;
    END GetCustomerBalance;

END CustomerManagement;
/
