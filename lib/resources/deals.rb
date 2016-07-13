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
            get("#{base_url}/#{deal['id']}/followers",
                     params: default_param).parse
        end

        def delete_follower(deal, user)
        end

        def products(deal)
            get("#{base_url}/#{deal['id']}/products",
                     params: default_param.merge!(include_product_data: 1)).parse
        end

        def add_product(deal, product)
        end

        def update_procut(deal, product)
        end

        def delete_product(deal, product)
        end

        def activities(deal)
            get("#{base_url}/#{deal['id']}/activities", params: default_param).parse
        end

        def log(deal)
          get("#{base_url}/#{deal['id']}/flow", params: default_param).parse
        end

        def add_participant(deal, person)
        end

        def participants(deal)
        end

        def delete_participant(deal, participant)
        end

        def files(deal)
        end

        def permitted_users(deal)
          get("#{base_url}/#{deal['id']}/permittedUsers", params: default_param).parse
        end

        def emails(deal)
        end

        def find_by_title(title)
            get("#{base_url}/find/", params: default_param.merge!(term: title)).parse
        end

        def timeline(deal)
        end

        def_delegators :endpoints, :all, :find, :create, :update, :remove, :remove_many, :duplicate, :merge

    end
end
