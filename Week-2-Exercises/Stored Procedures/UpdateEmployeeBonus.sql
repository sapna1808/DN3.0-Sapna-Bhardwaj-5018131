CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department_id IN NUMBER,
    p_bonus_percentage IN NUMBER
) AS
BEGIN
    -- Update the salary of employees in the specified department by adding the bonus
    UPDATE Employees
    SET salary = salary * (1 + p_bonus_percentage / 100)
    WHERE department_id = p_department_id;
    
    -- Commit the transaction
    COMMIT;
    
    -- Log the success
    INSERT INTO Log (log_message, log_date)
    VALUES ('Bonus updated for employees in department ID: ' || p_department_id, SYSDATE);
EXCEPTION
    WHEN OTHERS THEN
        -- Log the error
        INSERT INTO ErrorLog (error_message, error_date)
        VALUES (SQLERRM, SYSDATE);
        -- Rollback the transaction
        ROLLBACK;
        -- Raise the exception again
        RAISE;
END;
