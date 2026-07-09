-- Update the Supplier fields

UPDATE `tabSupplier`
    SET custom_contact_person_mobile = contact_person_mobile WHERE 
    contact_person_mobile IS NOT NULL AND contact_person_mobile != '' AND 
    custom_contact_person_mobile IS NULL;




SET SQL_SAFE_UPDATES=0; 
UPDATE `tabSupplier` 
	SET custom_contact_person_name = contact_person_name 
	WHERE contact_person_name IS NOT NULL AND contact_person_name != '';


SET SQL_SAFE_UPDATES=0; 
UPDATE `tabCustomer` 
	SET custom_contact_person_name = contact_person_name 
	WHERE contact_person_name IS NOT NULL AND contact_person_name != '';



UPDATE SQL_SAFE_UPDATES = 0;
UPDATE `tabStock Entry Details` 
	SET custom_adjustment_qty = adjustment_qty 
	WHERE adjustment_qty IS NOT NULL AND adjustment_qty != '';

UPDATE SQL_SAFE_UPDATES = 0;
UPDATE `tabWork Order Item`
	SET custom_batch_no = batch_no
	WHERE batch_no IS NOT NULL AND batch_no != '';



