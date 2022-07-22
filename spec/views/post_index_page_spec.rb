require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  before(:each) do
    @augusto = User.create(
      email: 'augusto@icloud.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'Augusto',
      bio: 'Hello World, I am Augusto'
    )
    (1..5).each do |id|
      Post.create(
        title: "Post #{id}",
        text: 'Hello World, I am Augusto',
        author_id: @augusto.id
      )
    end
    visit user_posts_path(@augusto)
  end

  it 'shows the username' do
    expect(page).to have_content(@augusto.name)
  end

  it 'shows the user\'s photo' do
    image = page.all('img')
    expect(image.size).to eql(1)
  end

  it 'shows the user\'s post counter' do
    expect(page).to have_content('Number of posts: 5')
  end

  it 'shows posts\' title' do
    expect(page).to have_content('Post 5')
    expect(page).to have_content('Post 4')
    expect(page).to have_content('Post 3')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 1')
  end

  it 'shows the post\'s text' do
    expect(page).to have_content('Hello World, I am Augusto')
  end

  it 'shows the post\'s number of comments' do
    expect(page).to have_content('Comments 0')
  end

  it 'shows the post\'s number of likes' do
    expect(page).to have_content('Likes 0')
  end

  it 'redirects to the posts show page when a post is clicked' do
    click_on 'Post 5'
    expect(page).to have_current_path user_post_path(@augusto, @augusto.posts.last)
    expect(page).to have_content('Hello World, I am Augusto')
  end

  it 'has a pagination button' do
    expect(page).to have_content('Pagination')
  end
end
