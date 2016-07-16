require 'spec_helper'

describe 'DealFields', vcr: true do
  let(:valid_new_deal_fields) { { :name => "New deal field", :field_type => "text" } }
  let(:invalid_new_deal_fields) { {:name => nil} }
  let(:not_found_deal_fields) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @deal_fields = client.deal_fields
    @deal_fields_response = []
    2.times do |number|
      @deal_fields_response << @deal_fields.create(:name => "#{number} - New deal field",:field_type => "text")
    end
    @deal_field = @deal_fields_response.first["data"]
    @another_deal_field = @deal_fields_response.last["data"]
  end

  after(:all) do
    # delete what left from test on sandbox
    @deal_fields.remove_many(@deal_fields_response)
  end

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @deal_fields.create(valid_new_deal_fields)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with name inside data' do
        response = @deal_fields.create(valid_new_deal_fields)
        expect(response['data']['name']).to be == valid_new_deal_fields[:name]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deal_fields.create(invalid_new_deal_fields)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#update' do
    context 'when success' do
      it 'return success true' do
        @another_deal_field["name"] = "Other name"
        response = @deal_fields.update(@another_deal_field)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deal_fields.update(invalid_new_deal_fields)
        expect(response['success']).to be_falsey
      end
    end
  end # end of update

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @deal_fields.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @deal_fields.remove(@deal_field)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @deal_fields.remove(not_found_deal_fields)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#delete_many' do
    context 'when success' do
      it 'returns success true' do
        response = @deal_fields.remove_many(@deal_fields_response)
        expect(response['success']).to be_truthy
      end
    end
  end # end of delete_many

  describe '#find' do
    context 'when success' do
      it 'returns success true' do
        response = @deal_fields.find(@another_deal_field['id'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @deal_fields.find(not_found_deal_fields['id'])
        expect(response['success']).to be_falsey
      end
    end
  end # end of find

end # end of DealFiels Resource
