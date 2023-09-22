require 'rails_helper'

RSpec.describe IcomeTransaction, type: :model do
  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: 123_456)
    @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')
    @icome_transaction = @category.icome_transactions.create(name: 'gloves', amount: 120, user_id: @user.id)
  end

  it 'Should be valid if all forms are filled' do
    expect(@icome_transaction).to be_valid
  end

  it 'Should be invalid if any of the fileds is missing' do
    @icome_transaction.name = ''
    @icome_transaction.amount = ''
    @icome_transaction.user_id = ''
    expect(@icome_transaction).not_to be_valid
    expect(@icome_transaction.errors[:name]).to include("can't be blank")
    expect(@icome_transaction.errors[:amount]).to include("can't be blank")
  end

  it 'Should be invalid if the amount is not a number or less than one' do
    @icome_transaction.amount = -1
    expect(@icome_transaction).not_to be_valid
    expect(@icome_transaction).not_to be_valid
  end
end
