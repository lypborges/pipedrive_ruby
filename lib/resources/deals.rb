# Deals represent ongoing, lost or won sales to an Organization or to a Person.
# Each deal has a monetary value and must be placed in a Stage. Deals can be owned by a User, and followed by one or many Users.
# Each Deal consists of standard data fields but can also contain a number of custom fields. The custom fields can be recognized by long hashes as keys.
# These hashes can be mapped against DealField.key. The corresponding label for each such custom field can be obtained from DealField.name.
class Deals < Client

  def all
    HTTP.get("#{API_URL}/deals", :params => default_param).parse
  end

  def create(deal)
    HTTP.post("#{API_URL}/deals", :params => default_param, :json => deal)
  end

  def update(deal)
    HTTP.put("#{API_URL}/deals/#{deal["id"]}", :params => default_param, :json => deal)
  end

  def delete(deal)
    HTTP.delete("#{API_URL}/deals/#{deal["id"]}", :params => default_param)
  end

  def delete_many(ids)
    HTTP.delete("#{API_URL}/deals/", :params => default_param, :json => {:ids => ids.join(',')} )
  end

  def activities(id)
    HTTP.get("#{API_URL}/deals/#{id}/activities", :params => default_param).parse
  end

  def find(id)
    HTTP.get("#{API_URL}/deals/#{id}", :params => default_param).parse
  end

  def followers(id)
    HTTP.get("#{API_URL}/deals/#{id}/followers", :params => default_param).parse
  end


end
