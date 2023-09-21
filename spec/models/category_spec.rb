require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @user = User.create(name: 'ronnie', email: 'ronnie@gmail.com', password: 123456)
    @category = @user.categories.create(name: 'gym', icon: 'gym.jpg')
  end

  it 'should creae category if all fields are valid' do
    expect(@category).to be_valid
  end

  it 'should be invalid if any field is missing' do
    @category.name = ''
    @category.icon = ''
    expect(@category).not_to be_valid
    expect(@category.errors[:name]).to include("can't be blank")
    expect(@category.errors[:icon]).to include("can't be blank")
  end
end