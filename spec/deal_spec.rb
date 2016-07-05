require 'spec_helper'

describe 'Pipedrive Deals request', :vcr=> true do
  it 'returns a list of deals' do
    deals = Deals.new(ENV["API_TOKEN"])

    response = deals.all

    expect(response["success"]).to be_truthy
  end
end
