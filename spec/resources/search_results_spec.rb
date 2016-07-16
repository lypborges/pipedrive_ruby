require 'spec_helper'

describe 'SearchResults', vcr: true do

  before(:all) do
    @client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @search_result = @client.search_results
  end

  describe '#all' do
    context 'when success' do
      it 'returns succes true' do
        response = @search_result.all({:term => 'novo'})
        expect(response['success']).to be_truthy
      end
    end
  end # end of all

  describe '#field' do
    context 'when success' do
      it 'returns succes true' do
        response = @search_result.field({:term => 'novo', :field_type => 'dealField', :field_key => "title"})
        expect(response['success']).to be_truthy
      end
    end
  end # end of all



end # end of Recents Resource
