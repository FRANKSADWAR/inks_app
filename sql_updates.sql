-- Update the Supplier fields


SET SQL_SAFE_UPDATES = 0;
UPDATE `tabSales Order Item`
	SET custom_packaging = packaging WHERE 
	packaging IS NOT NULL AND packaging != '';


SET SQL_SAFE_UPDATES = 0;
UPDATE `tabSales Order Item`
	SET custom_pack_type = pack_type WHERE 
	pack_type IS NOT NULL AND pack_type != '';

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabDelivery Note Item`
	SET custom_packaging = packaging WHERE 
	packaging IS NOT NULL AND packaging != '';

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabDelivery Note Item`
	SET custom_pack_type = pack_type WHERE 
	pack_type IS NOT NULL AND pack_type != '';


SET SQL_SAFE_UPDATES=0;
	UPDATE `tabSales Invoice Item`
	SET custom_packaging = packaging WHERE
	packaging IS NOT NULL AND packaging != '';


SET SQL_SAFE_UPDATES=0;
	UPDATE `tabSales Invoice Item`
	SET custom_pack_type = pack_type WHERE
	pack_type IS NOT NULL AND pack_type != '';



SET SQL_SAFE_UPDATES=0; 
UPDATE `tabCustomer` 
	SET custom_contact_person_name = contact_person_name 
	WHERE contact_person_name IS NOT NULL AND contact_person_name != '';


SET SQL_SAFE_UPDATES=0; 
UPDATE `tabCustomer` 
	SET custom_contact_person_mobile = contact_person_mobile 
	WHERE contact_person_mobile IS NOT NULL AND contact_person_mobile != '';


UPDATE `tabSupplier`
    SET custom_contact_person_mobile = contact_person_mobile WHERE 
    contact_person_mobile IS NOT NULL AND contact_person_mobile != '' AND 
    custom_contact_person_mobile IS NULL;


SET SQL_SAFE_UPDATES=0; 
UPDATE `tabSupplier` 
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

-- Is this really needed here
SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabStock Entry` SET custom_customer = custom_customer_name
	WHERE custom_customer IS NOT NULL AND custom_customer !='';


SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabWork Order` SET custom_work_order_batch = work_order_batch
	WHERE work_order_batch IS NOT NULL AND work_order_batch !='';


SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabWork Order` SET custom_item_batch_number = item_batch_number
	WHERE item_batch_number IS NOT NULL AND item_batch_number !='';

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabWork Order` SET custom_quality_inspection_template = quality_inspection_template
	WHERE quality_inspection_template IS NOT NULL AND quality_inspection_template !='';

SET SQL_SAFE_UPDATES =0;
	UPDATE `tabWork Order` SET custom_certificate_of_analysis_template = certificate_of_analysis_template
	WHERE certificate_of_analysis_template IS NOT NULL AND certificate_of_analysis_template !='';


SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabPurchase Invoice` SET custom_etr_serial_number = etr_serial_number
	WHERE etr_serial_number IS NOT NULL AND etr_serial_number !='';


SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabSales Invoice` SET custom_etr_serial_number = etr_serial_number
	WHERE etr_serial_number IS NOT NULL AND etr_serial_number !='';

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabSales Invoice` SET custom_cu_link = cu_link
	WHERE cu_link IS NOT NULL AND cu_link !='';
	

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabSales Invoice` SET custom_cu_invoice_date = cu_invoice_date
	WHERE cu_invoice_date IS NOT NULL AND cu_invoice_date != '';

SET SQL_SAFE_UPDATES = 0;
	UPDATE `tabSales Invoice` SET custom_cu_invoice_number = cu_invoice_number
	WHERE cu_invoice_number IS NOT NULL AND cu_invoice_number != '';




