require 'rails_helper'

RSpec.describe 'Expense', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'Get /new' do
    before do
      @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')

      get new_category_icome_transaction_path(@category)
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:new)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('New transaction')
    end
  end
end