require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: 123_456)
    @user.save
    sign_in @user
  end

  describe 'GET /index' do
    before do
      get categories_path
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template('categories/index')
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('Categories')
    end
  end

  describe 'POST /new' do
    before do
      @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')
      get new_category_path
    end

    it 'Should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'Should return correct template' do
      expect(response).to render_template(:new)
    end

    it 'Should return place holder from the body' do
      expect(response.body).to include('New Category')
    end
  end
end
