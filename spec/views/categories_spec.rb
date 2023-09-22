require 'rails_helper'

RSpec.describe 'category/index', type: :view do
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: 123_456)
    sign_in @user
  end

  describe 'Category index' do
    before do
      @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')
    end

    it 'should see title on the categories page' do
      visit categories_path
      expect(page).to have_content('Categories')
    end

    it 'display category icons' do
      visit categories_path
      expect(page).to have_css("img[src='#{@category.icon}']")
    end
  end
end
