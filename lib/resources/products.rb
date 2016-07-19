# Products are the goods or services you are dealing with.
# Each product can have N different price points - first, each Product can have a price in N different currencies, and secondly, each Product can have N variations of itself, each having N prices different currencies.
# Note that only one price per variation per currency is supported.
# Products can be instantiated to Deals. In the context of instatiation, a custom price, quantity, duration and discount can be applied.
module PipedriveRuby
  class Products < PipedriveRuby::Base

    def deals(product)
      custom_get(:path => "#{product['id']}/deals")
    end

    def find_by_name(term)
      find_by(term)
    end

    def_delegators :endpoints,
                              :add_follower,
                              :all,
                              :delete_follower,
                              :find,
                              :find_by,
                              :files,
                              :followers,
                              :create,
                              :permitted_users,
                              :update,
                              :remove
  end
end
