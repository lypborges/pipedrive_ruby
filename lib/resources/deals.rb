# Deals represent ongoing, lost or won sales to an Organization or to a Person.
# Each deal has a monetary value and must be placed in a Stage. Deals can be owned by a User, and followed by one or many Users.
# Each Deal consists of standard data fields but can also contain a number of custom fields. The custom fields can be recognized by long hashes as keys.
# These hashes can be mapped against DealField.key. The corresponding label for each such custom field can be obtained from DealField.name.
module PipedriveRuby
    # This class should hold all endpoints that are specific of deals
    class Deals < PipedriveRuby::Base

        def delete_follower(deal, user)
        end

        def products(deal)
          custom_get(:path => "#{deal['id']}/products",
                      :params => {:include_product_data => 1}
                    )
        end

        def add_product(deal, product)
        end

        def update_product(deal, product)
        end

        def delete_product(deal, product)
        end

        def activities(deal)
            custom_get(:path => "#{deal['id']}/activities")
        end

        def log(deal)
          custom_get(:path => "#{deal['id']}/flow")
        end

        def add_participant(deal, person)
        end

        def participants(deal)
          custom_get(:path => "#{deal['id']}/participants")
        end

        def delete_participant(deal, participant)
        end

        def emails(deal)
          custom_get(:path => "#{deal['id']}/emailMessages")
        end

        def find_by_title(term)
            find_by(term)
        end

        def timeline
        end

        def_delegators :endpoints,
                                  :add_follower,
                                  :all,
                                  :find,
                                  :find_by,
                                  :files,
                                  :followers,
                                  :create,
                                  :duplicate,
                                  :merge,
                                  :permitted_users,
                                  :remove,
                                  :remove_many,
                                  :update

    end
end
