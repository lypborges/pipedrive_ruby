# Supported currencies which can be used to represent the monetary value of a Deal, or a value of any monetary type custom field.
# The Currency.code field must be used to point to a currency.
# Currency.code is the ISO-4217 format currency code for non-custom currencies.
# You can differentiate custom and non-custom currencies using the is_custom_flag property.
# For custom currencies, it is intended that the formatted sums are displayed in the UI using the following format: [sum][non-breaking space character][currency.symbol], for example: 500 users.
# Custom currencies cannot be added or removed via the API yet — rather the admin users of the account must configure them from the Pipedrive app
class Currencies
end
