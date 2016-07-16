module PipedriveRuby
# Ordered reference objects, pointing to either Deals, Persons, Organizations, Files or Products.
  class SearchResults < PipedriveRuby::Base

    # Performs a search from a specific field's values. Results can be either the distinct values of the field (useful for searching autocomplete field values), or actual items IDs (deals, persons, organizations or products).
    # Works only with the following field types: varchar, varchar_auto, double, address, text, phone, date.
    def field(params={})
      options = {:params => params}
      options[:path] = 'field'
      custom_get(options)
    end
    def_delegators :endpoints, :all, :custom_get
  end
end
