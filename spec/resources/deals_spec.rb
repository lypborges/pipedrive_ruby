require 'spec_helper'

describe 'Deals', vcr: true do
  let(:valid_new_deal) { { title: 'Novo Negocio' } }
  let(:invalid_new_deal) { {} }
  let(:not_found_deal) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @deals = client.deals
    @deals_response = []
    2.times do |number|
      @deals_response << @deals.create(title: "#{number} - Novo Negocio")
    end
    all = @deals.all
    @deal = all['data'].first
    @another_deal = all['data'].last
  end

  after(:all) do
    # delete what left from test on sandbox
    @deals.remove_many(@deals_response)
  end

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @deals.create(valid_new_deal)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with title inside data' do
        response = @deals.create(valid_new_deal)
        expect(response['data']['title']).to be == valid_new_deal[:title]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.create(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @deals.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#update' do
    context 'when success' do
      it 'returns success true' do
        updated_deal = { 'id' => @deal['id'], 'value' => rand(1000) }
        response = @deals.update(updated_deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when not found' do
      it 'returns success false' do
        response = @deals.update(not_found_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.remove(@deal)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @deals.remove(not_found_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#delete_many' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.remove_many(@deals_response)
        expect(response['success']).to be_truthy
      end
    end
  end # end of delete_many

  describe '#activities' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.activities(@deal)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @deals.activities(not_found_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of activities

  describe '#find' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.find(@deal['id'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @deals.find(not_found_deal['id'])
        expect(response['success']).to be_falsey
      end
    end
  end # end of find

  describe '#find_by_title' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.find_by_title(@deal['title'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when not found' do
      it 'return data nil' do
        response = @deals.find_by_title('not exist')
        expect(response['data']).to be_nil
      end
    end
  end # end of find_by_title

  describe '#followers' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.followers(@deal)
        expect(response['success']).to be_truthy
      end
    end
    context 'when not found' do
      it 'return data nil' do
        response = @deals.followers(not_found_deal)
        expect(response['data']).to be_nil
      end
    end
  end # end of followers

  describe '#permitted_users' do
    context 'when success' do
      it 'return success true' do
        response = @deals.permitted_users(@deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.permitted_users(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of permitted_users

  describe '#products' do
    context 'when success' do
      it 'returns success true' do
        response = @deals.products(@deal)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @deals.products(not_found_deal)
        expect(response['data']).to be_falsey
      end
    end
  end # end of products

  describe '#duplicate' do
    context 'when success' do
      it 'return success true' do
        response = @deals.duplicate(@deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.duplicate(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of duplicate

  describe '#merge' do
    context 'when success' do
      it 'return success true' do
        response = @deals.merge(@deal, @another_deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.merge(invalid_new_deal, invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of merge

  describe '#log' do
    context 'when success' do
      it 'return success true' do
        response = @deals.log(@deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.log(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of log

  describe '#participants' do
    context 'when success' do
      it 'return success true' do
        response = @deals.participants(@deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.participants(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of participants

  describe '#files' do
    context 'when success' do
      it 'return success true' do
        response = @deals.files(@deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @deals.files(invalid_new_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of files

end # end of Deals Resource
