# ProductFields represent the near-complete schema for a Product in the context of the company of the authorized user.
# Each company can have a different schema for their Products, with various custom fields.
# In the context of using ProductFields as a schema for defining the data fields of a Product, it must be kept in mind that some types of custom fields can have additional data fields which are not separate ProductFields per se.
# Such is the case with monetary, daterange and timerange fields – each of these fields will have one additional data field in addition to the one presented in the context of ProductFields.
# For example, if there is a monetary field with the key 'ffk9s9' stored on the account, 'ffk9s9' would hold the numeric value of the field, and 'ffk9s9_currency' would hold the ISO currency code that goes along with the numeric value.
# To find out which data fields are available, fetch one Product and list its keys.
class ProductFields
end
