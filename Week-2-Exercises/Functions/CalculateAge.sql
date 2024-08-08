CREATE OR REPLACE FUNCTION CalculateAge (
    p_date_of_birth DATE
) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, p_date_of_birth) / 12)
    INTO v_age
    FROM DUAL;
    
    RETURN v_age;
END CalculateAge;
/
