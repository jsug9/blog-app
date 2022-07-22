require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @augusto = User.new(
      email: 'augusto@icloud.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'Augusto',
      bio: 'Hello World, I am Augusto'
    )
    @augusto.skip_confirmation!
    @augusto.save!
    @emily = User.new(
      email: 'emily@icloud.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'Emily',
      bio: 'Hello World, I am Emily'
    )
    @emily.skip_confirmation!
    @emily.save!
    visit root_path
  end

  it 'shows the username' do
    expect(page).to have_content(@augusto.name)
    expect(page).to have_content(@emily.name)
  end

  it 'shows the users\' photo' do
    image = page.all('img')
    expect(image.size).to eql(2)
  end

  it 'shows the user\'s post counter' do
    expect(page).to have_content('Number of posts: 0')
  end

  it 'redirects to the user\'s show page when clicked' do
    click_on 'Augusto'
    expect(page).to have_current_path user_path(@augusto)
    expect(page).to have_content('Hello World, I am Augusto')
  end
end
