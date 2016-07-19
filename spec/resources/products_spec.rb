require 'spec_helper'

describe 'Products', vcr: true do
  let(:valid_new_product) { { name: 'Novo Produto' } }
  let(:invalid_new_product) { {} }
  let(:not_found_deal) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @user = {'id'=> ENV['USER_ID']}
    @invalid_user = {'id' => 0}
    @products = client.products
    @products_response = []
    2.times do |number|
      @products_response << @products.create(name: "#{number} - Novo Produto")
    end
    all = @products.all
    @product = all['data'].first
    @another_deal = all['data'].last
  end

  after(:all) do
    # delete what left from test on sandbox
    @products_response.each do |product|
      @products.remove(product["data"])
    end
  end

  describe '#add_follower' do
    context 'when success' do
      it 'return success true' do
        response = @products.add_follower(@product,@user)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @products.add_follower(@product,@invalid_user)
        expect(response['success']).to be_falsey
      end
    end
  end # end of add_follower

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @products.create(valid_new_product)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with title inside data' do
        response = @products.create(valid_new_product)
        expect(response['data']['name']).to be == valid_new_product[:name]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @products.create(invalid_new_product)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of products' do
        response = @products.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#update' do
    context 'when success' do
      it 'returns success true' do
        updated_deal = { 'id' => @product['id'], 'name' => "Other product" }
        response = @products.update(updated_deal)
        expect(response['success']).to be_truthy
      end
    end

    context 'when not found' do
      it 'returns success false' do
        response = @products.update(not_found_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @products.remove(@product)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @products.remove(not_found_deal)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#delete_follower' do
    context 'when success' do
      it 'return success true' do
        follower_response = @products.add_follower(@product,@user)
        follower = {'id' => follower_response['data']['id']}
        response = @products.delete_follower(@product,follower)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        @products.add_follower(@product,@user)
        response = @products.delete_follower(@product,@invalid_user)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete_follower


  describe '#find' do
    context 'when success' do
      it 'returns success true' do
        response = @products.find(@product['id'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @products.find(not_found_deal['id'])
        expect(response['success']).to be_falsey
      end
    end
  end # end of find

  describe '#find_by_name' do
    context 'when success' do
      it 'returns success true' do
        response = @products.find_by_name(@product['name'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when not found' do
      it 'return data nil' do
        response = @products.find_by_name('not exist')
        expect(response['data']).to be_nil
      end
    end
  end # end of find_by_name

  describe '#followers' do
    context 'when success' do
      it 'returns success true' do
        response = @products.followers(@product)
        expect(response['success']).to be_truthy
      end
    end
    context 'when not found' do
      it 'return data nil' do
        response = @products.followers(not_found_deal)
        expect(response['data']).to be_nil
      end
    end
  end # end of followers

  describe '#permitted_users' do
    context 'when success' do
      it 'return success true' do
        response = @products.permitted_users(@product)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @products.permitted_users(invalid_new_product)
        expect(response['success']).to be_falsey
      end
    end
  end # end of permitted_users

  describe '#deals' do
    context 'when success' do
      it 'returns success true' do
        response = @products.deals(@product)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @products.deals(not_found_deal)
        expect(response['data']).to be_falsey
      end
    end
  end # end of deals


  describe '#files' do
    context 'when success' do
      it 'return success true' do
        response = @products.files(@product)
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @products.files(invalid_new_product)
        expect(response['success']).to be_falsey
      end
    end
  end # end of files

end # end of Products Resource
