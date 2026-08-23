import frappe
import json

@frappe.whitelist(allow_guest=True)
def get_coa_details(coa_id):
    coa_details = frappe.db.sql("""SELECT test_parameter, specification, analysis FROM `tabCOA Items` WHERE parent = %s""",(coa_id),as_dict=True)
    return coa_details



@frappe.whitelist(allow_guest=True)
def get_work_order_batch_number(work_order_id):
    batch_no = frappe.db.get_value("Batch",{"reference_name":work_order_id},"batch_id")
    return batch_no



@frappe.whitelist(allow_guest=True)
def get_work_order_item_batches(work_order_id):
    batches_object = []
    items = frappe.db.sql("""SELECT item_code, required_qty FROM `tabWork Order Item` WHERE parent = %s""",(work_order_id), as_dict=True)
    for i in range(len(items)):
        item_code = items[i].item_code
        required_qty = items[i].required_qty
        item_batch_list = frappe.db.sql("""SELECT item, batch_id, batch_qty FROM `tabBatch` WHERE item = %s AND batch_qty > 0 ORDER BY creation ASC""",(item_code),as_dict=True)
        final_batch = []
        batches = []

        qty_in_first_batch = item_batch_list[0].batch_qty

        for i in range(len(item_batch_list)):
            batch_id = item_batch_list[i].batch_id
            batches.append(batch_id)

        if required_qty < qty_in_first_batch:
            final_batch.append(batches[0])
        else:
            final_batch = batches[0]

        item_batch_dict = {"item_code": item_code, "batch_numbers": final_batch}
        batches_object.append(item_batch_dict)
    return batches_object



@frappe.whitelist(allow_guest=True)
def get_item_and_rate(doc, event):
    item  = doc.item
    cost  = float(doc.raw_material_cost)
    qty = float(doc.quantity)

    rate = round((cost / qty),2)

    item_group = frappe.db.get_value('Item',item,'item_group')

    item_price_name = frappe.db.get_value("Item Price", {"item_code": item,"buying":1})

    print(item_price_name)

    if item_group in ["VARNISHES","CONCENTRATES","FINISHED GOODS BULK"]:
        ## check whether the price exists in the item price list first

        if frappe.db.exists({"doctype":"Item Price", "item_code": item, "buying":1}):
            frappe.db.update('Item Price', item_price_name, {
                'price_list_rate': rate,
                'price_list': 'Standard Buying'
            })
            frappe.db.commit()
        else:
            item_price = frappe.get_doc({
                "doctype": "Item Price",
                "item_code": item,
                "price_list": "Standard Buying",
                "buying": 1,
                "price_list_rate": rate
            })
            item_price.insert(ignore_permissions=True)
            frappe.db.commit()



@frappe.whitelist(allow_guest=True)
def get_bom_item(bom_name):
    res = frappe.db.sql("""SELECT bom.name, bom.item, bom.item_name, bitm.item_code, bitm.qty, bitm.rate FROM `tabBOM Item` 
                        AS bitm INNER JOIN `tabBOM` AS bom ON bitm.parent = bom.name WHERE bom.name = %s""", (bom_name), as_dict=True)
    return res


@frappe.whitelist(allow_guest=True)
def get_customer_details():
    query = frappe.db.sql(""" SELECT name, customer_name, customer_group, territory, gender, mobile_no, email_id FROM `tabCustomer`; """, as_dict = True)

    return json.dumps(query)

