# Organizations are companies and other kinds of organizations you are making Deals with.
# Persons can be associated with organizations so that each organization can contain one or more Persons.
module PipedriveRuby
    class Organizations < PipedriveRuby::Base
        def_delegators :client, :default_param
        def_delegators :endpoints, :all, :find, :create, :update
    end
end
