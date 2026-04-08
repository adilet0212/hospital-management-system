CREATE OR REPLACE PROCEDURE CheckInventory (p_medicine_name IN VARCHAR2) IS
    v_stock NUMBER;
    v_expiration_date DATE;
    v_manufacturer VARCHAR2(100);
BEGIN
    SELECT stock, expiration_date, manufacturer
    INTO v_stock, v_expiration_date, v_manufacturer
    FROM Inventory
    WHERE medicine_name = p_medicine_name;

    DBMS_OUTPUT.PUT_LINE('Medicine Name: ' || p_medicine_name);
    DBMS_OUTPUT.PUT_LINE('Stock: ' || v_stock);
    DBMS_OUTPUT.PUT_LINE('Expiration Date: ' || TO_CHAR(v_expiration_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Manufacturer: ' || v_manufacturer);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory found for the medicine: ' || p_medicine_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END CheckInventory;