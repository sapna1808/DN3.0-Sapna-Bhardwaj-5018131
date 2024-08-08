DECLARE
    v_new_interest_rate CONSTANT NUMBER := 0.05; -- New interest rate, for example 5%

    CURSOR UpdateLoanInterestRates IS
        SELECT loan_id, interest_rate
        FROM loans;

    TYPE LoanRecord IS RECORD (
        loan_id       loans.loan_id%TYPE,
        interest_rate loans.interest_rate%TYPE
    );

    v_loan LoanRecord;
BEGIN
    OPEN UpdateLoanInterestRates;

    LOOP
        FETCH UpdateLoanInterestRates INTO v_loan;
        EXIT WHEN UpdateLoanInterestRates%NOTFOUND;

        UPDATE loans
        SET interest_rate = v_new_interest_rate
        WHERE loan_id = v_loan.loan_id;

        DBMS_OUTPUT.PUT_LINE('Updated interest rate for Loan ID: ' || v_loan.loan_id || ' to ' || v_new_interest_rate);
    END LOOP;

    CLOSE UpdateLoanInterestRates;
    COMMIT;
END;
/
