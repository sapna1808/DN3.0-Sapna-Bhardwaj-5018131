CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(
        p_customer_id    IN NUMBER,
        p_name           IN VARCHAR2,
        p_address        IN VARCHAR2,
        p_phone          IN VARCHAR2
    );

    PROCEDURE UpdateCustomer(
        p_customer_id    IN NUMBER,
        p_name           IN VARCHAR2,
        p_address        IN VARCHAR2,
        p_phone          IN VARCHAR2
    );

    FUNCTION GetCustomerBalance(
        p_customer_id    IN NUMBER
    ) RETURN NUMBER;
END CustomerManagement;
/
