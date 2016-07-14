# Deals represent ongoing, lost or won sales to an Organization or to a Person.
# Each deal has a monetary value and must be placed in a Stage. Deals can be owned by a User, and followed by one or many Users.
# Each Deal consists of standard data fields but can also contain a number of custom fields. The custom fields can be recognized by long hashes as keys.
# These hashes can be mapped against DealField.key. The corresponding label for each such custom field can be obtained from DealField.name.
module PipedriveRuby
    # This class should hold all endpoints that are specific of deals
    class Deals < PipedriveRuby::Base

        def add_followers(deal, user)
        end

        def followers(deal)
          custom_get(:path => "#{deal['id']}/followers")
        end

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

        def files(deal)
          custom_get(:path => "#{deal['id']}/files")
        end

        def permitted_users(deal)
          custom_get(:path => "#{deal['id']}/permittedUsers")
        end

        def emails(deal)
          custom_get(:path => "#{deal['id']}/emailMessages")
        end

        def find_by_title(title)
            custom_get(:path => "find/", :params => {:term => title})
        end

        def timeline
        end

        def_delegators :endpoints, :all, :find, :create, :update, :remove, :remove_many, :duplicate, :merge

    end
end
