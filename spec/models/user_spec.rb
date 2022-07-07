require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Aaron', photo: 'photo', bio: 'Hey folks!', post_counter: 0)
    @user.save
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    @user.post_counter = nil
    expect(@user).to_not be_valid
  end
end
