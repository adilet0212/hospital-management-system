CREATE OR REPLACE FUNCTION Get_Patient(
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_date_of_birth IN DATE
) RETURN SYS_REFCURSOR
IS
    patient_cursor SYS_REFCURSOR;
BEGIN
    OPEN patient_cursor FOR
        SELECT id, first_name, last_name, gender, date_of_birth, phone_number, address, email, emergency_contact, room_number
        FROM Patients
        WHERE first_name = p_first_name
          AND last_name = p_last_name
          AND date_of_birth = p_date_of_birth;

    RETURN patient_cursor;
END;
/

-- Example to search for a patient by name and birth date
SET SERVEROUTPUT ON;

DECLARE
    cursor_output SYS_REFCURSOR;
    patient_record Patients%ROWTYPE;
    record_found BOOLEAN := FALSE;
BEGIN
    cursor_output := Get_Patient('Alice', 'Johnson', TO_DATE('1985-07-23', 'YYYY-MM-DD'));
    
    LOOP
        FETCH cursor_output INTO patient_record;
        EXIT WHEN cursor_output%NOTFOUND;
        
        record_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('ID: ' || patient_record.id);
        DBMS_OUTPUT.PUT_LINE('First Name: ' || patient_record.first_name);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || patient_record.last_name);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || patient_record.gender);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || patient_record.date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || patient_record.phone_number);
        DBMS_OUTPUT.PUT_LINE('Address: ' || patient_record.address);
        DBMS_OUTPUT.PUT_LINE('Email: ' || patient_record.email);
        DBMS_OUTPUT.PUT_LINE('Emergency Contact: ' || patient_record.emergency_contact);
        DBMS_OUTPUT.PUT_LINE('Room Number: ' || patient_record.room_number);
    END LOOP;
    
    IF NOT record_found THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with the given name and birth date.');
    END IF;
    
    CLOSE cursor_output;
END;
/
