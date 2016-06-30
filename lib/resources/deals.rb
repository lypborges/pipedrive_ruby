# Deals represent ongoing, lost or won sales to an Organization or to a Person.
# Each deal has a monetary value and must be placed in a Stage. Deals can be owned by a User, and followed by one or many Users.
# Each Deal consists of standard data fields but can also contain a number of custom fields. The custom fields can be recognized by long hashes as keys.
# These hashes can be mapped against DealField.key. The corresponding label for each such custom field can be obtained from DealField.name.
class Deals
  include HTTP

  def initialize
    puts HTTP.get("https://api.pipedrive.com/v1/deals?start=0&api_token=c306e8dc8011d1f255b02aaed556ab1242800d79").to_s
  end

end
