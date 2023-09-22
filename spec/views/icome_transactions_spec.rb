require 'rails_helper'

RSpec.describe 'Transaction_entry', type: :view do
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: 123456)
    sign_in @user
    @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')
    @icome_transaction = @category.icome_transactions.create(name: 'gloves', amount: 120, user_id: @user.id)

    visit category_icome_transactions_path(category_id: @category.id)
  end

  it 'should display transaction name' do
    expect(page).to have_content('gloves')
  end

  it 'redirects to correct page when clicked' do
    back_link = find("a.back-btn[href=\"#{categories_path}\"]")

    back_link.click

    expect(page).to have_current_path(categories_path)
  end
end
