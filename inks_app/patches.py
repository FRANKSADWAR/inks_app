import frappe

def execute():
    frappe.db.sql(
	""" UPDATE `tabSupplier` SET custom_contact_person_mobile = contact_person_mobile
	    WHERE contact_person_mobile IS NOT NULL
	"""
	)
    frappe.db.commit()
