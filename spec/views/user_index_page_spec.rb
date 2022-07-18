require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  before(:each) do
    @augusto = User.create(name: 'Augusto', photo: 'Photo', bio: 'Hello World, I am Augusto')
    @emily = User.create(name: 'Emily', photo: 'Photo', bio: 'Hello World, I am Emily')
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

  it 'renders the user\'s show page when clicked' do
    click_on 'Augusto'
    expect(page).to have_current_path user_path(@augusto)
    expect(page).to have_content('Hello World, I am Augusto')
  end
end
