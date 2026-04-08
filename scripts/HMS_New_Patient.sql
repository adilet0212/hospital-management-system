CREATE OR REPLACE PROCEDURE Add_New_Patient (
    p_id IN INT,
    p_first_name IN VARCHAR2,
    p_last_name IN VARCHAR2,
    p_gender IN VARCHAR2,
    p_date_of_birth IN DATE,
    p_phone_number IN VARCHAR2,
    p_address IN VARCHAR2,
    p_email IN VARCHAR2,
    p_emergency_contact IN VARCHAR2,
    p_room_number IN VARCHAR2,
    p_result OUT VARCHAR2
)
IS
    room_count INT;
BEGIN
    -- Check if the room number is already occupied
    SELECT COUNT(*)
    INTO room_count
    FROM Patients
    WHERE room_number = p_room_number;

    IF room_count > 0 THEN
        p_result := 'Failed: Room number is occupied';
    ELSE
        -- Insert the new patient
        INSERT INTO Patients (id, first_name, last_name, gender, date_of_birth, phone_number, address, email, emergency_contact, room_number)
        VALUES (p_id, p_first_name, p_last_name, p_gender, p_date_of_birth, p_phone_number, p_address, p_email, p_emergency_contact, p_room_number);
        
        p_result := 'Success: Patient added';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        p_result := 'Failed: ' || SQLERRM;
END;


-- Example to add a new patient
DECLARE
    result VARCHAR2(100);
BEGIN
    Add_New_Patient(
        p_id => 9012,
        p_first_name => 'Mark',
        p_last_name => 'Lee',
        p_gender => 'Male',
        p_date_of_birth => TO_DATE('1999-08-02', 'YYYY-MM-DD'),
        p_phone_number => '647-612-9981',
        p_address => '321 Yonge St',
        p_email => 'marklee@gmail.com',
        p_emergency_contact => 'Jane Kim',
        p_room_number => '112',
        p_result => result
    );
    DBMS_OUTPUT.PUT_LINE(result);
END;
