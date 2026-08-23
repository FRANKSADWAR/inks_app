import frappe
import json

@frappe.whitelist(allow_guest = True)
def get_listed_customers():
    customers = frappe.db.sql(f""" SELECT name, customer_name,mobile_no, territory, customer_group FROM `tabCustomer` WHERE mobile_no IS NOT NULL; """, as_dict = True)
    return customers

@frappe.whitelist(allow_guest = True)
def get_single_customer():
    customer = frappe.db.sql(f""" SELECT customer_name, customer_group, territory, gender, mobile_no, email_id, contact_person_name AS hub, "Yes I agree" AS consent_field FROM `tabCustomer` WHERE customer_name LIKE '%Lilian%'; """, as_dict = True)
    return customer

