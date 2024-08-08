CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) AS
    v_current_salary NUMBER;
BEGIN
    -- Retrieve the current salary of the employee
    SELECT salary INTO v_current_salary
    FROM Employees
    WHERE employee_id = p_employee_id;

    -- Update the salary
    UPDATE Employees
    SET salary = salary * (1 + p_percentage / 100)
    WHERE employee_id = p_employee_id;

    -- Commit transaction
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Log the error when employee ID does not exist
        INSERT INTO ErrorLog (error_message, error_date)
        VALUES ('Employee ID not found: ' || p_employee_id, SYSDATE);
        -- Raise the exception again to propagate the error
        RAISE;
    WHEN OTHERS THEN
        -- Log any other errors
        INSERT INTO ErrorLog (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        -- Rollback transaction
        ROLLBACK;
        -- Raise the exception again to propagate the error
        RAISE;
END;
