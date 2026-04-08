CREATE OR REPLACE TRIGGER UpdateInventoryAfterInsert
AFTER INSERT ON Medications
FOR EACH ROW
DECLARE
    v_stock NUMBER;
BEGIN
    -- Get the current stock for the inserted medication
    SELECT stock INTO v_stock FROM Inventory WHERE medicine_name = :NEW.MEDICINE_NAME;

    -- Update the stock in the Inventory table
    UPDATE Inventory
    SET stock = v_stock - :NEW.AMOUNT
    WHERE medicine_name = :NEW.MEDICINE_NAME;

    -- Raise an exception if stock goes negative
    IF v_stock - :NEW.AMOUNT < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock cannot be negative for medicine: ' || :NEW.MEDICINE_NAME);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'No inventory found for the medicine: ' || :NEW.MEDICINE_NAME);
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END UpdateInventoryAfterInsert;
