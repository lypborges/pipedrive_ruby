# Deals represent ongoing, lost or won sales to an Organization or to a Person.
# Each deal has a monetary value and must be placed in a Stage. Deals can be owned by a User, and followed by one or many Users.
# Each Deal consists of standard data fields but can also contain a number of custom fields. The custom fields can be recognized by long hashes as keys.
# These hashes can be mapped against DealField.key. The corresponding label for each such custom field can be obtained from DealField.name.

# TODO after finish Deals and Organization, use metaprogramming for reduce the code.
class Deals < Client

  def all
    HTTP.get("#{API_URL}/deals", :params => default_param).parse
  end

  def find(id)
    HTTP.get("#{API_URL}/deals/#{id}", :params => default_param).parse
  end

  def create(deal)
    HTTP.post("#{API_URL}/deals",
                :params => default_param,
                :json => deal
              ).parse
  end

  def update(deal)
    HTTP.put("#{API_URL}/deals/#{deal["id"]}",
              :params => default_param,
              :json => deal
            ).parse
  end

  def delete(deal)
    HTTP.delete("#{API_URL}/deals/#{deal["id"]}",
                  :params => default_param
                ).parse
  end

  def delete_many(deals)
    ids =[]
    deals.each do |deal|
      ids << deal["data"]["id"]
    end
    HTTP.delete("#{API_URL}/deals/",
                  :params => default_param,
                  :json => {:ids => ids.join(',')}
                ).parse
  end

  def duplicate(deal)
    HTTP.post("#{API_URL}/deals/#{deal["id"]}/duplicate",
                :params => default_param
              ).parse
  end

  def merge(deal, merge_with_deal)
    HTTP.post("#{API_URL}/deals/#{deal["id"]}/merge",
              :params => default_param,
              :form => {
                        :id => deal["id"],
                        :merge_with_id => merge_with_deal["id"]
                        }
              ).parse
  end

  def add_followers(deal, user)
  end

  def followers(deal)
    HTTP.get("#{API_URL}/deals/#{deal["id"]}/followers",
              :params => default_param
            ).parse
  end

  def delete_follower(deal, user)
  end

  def products(deal)
    HTTP.get("#{API_URL}/deals/#{deal["id"]}/products",
              :params => default_param
            ).parse
  end

  def add_product(deal,product)
  end

  def update_procut(deal,product)
  end

  def delete_product(deal,product)
  end

  def activities(deal)
    HTTP.get("#{API_URL}/deals/#{deal["id"]}/activities",
              :params => default_param.merge!(:include_product_data=>1)
            ).parse
  end

  def log(deal)
  end

  def add_participant(deal,person)
  end

  def participants(deal)
  end

  def delete_participant(deal,participant)
  end

  def files(deal)
  end

  def permitted_users(deal)
  end

  def emails(deal)
  end

  def find_by_title(title)
    HTTP.get("#{API_URL}/deals/find/", :params => default_param.merge!({:term => title})).parse
  end

  def timeline(deal)
  end

end
