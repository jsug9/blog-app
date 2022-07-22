require 'rails_helper'

RSpec.describe 'Post Show Page', type: :feature do
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
    @post = Post.create(
      title: 'Post 1',
      text: 'Hello World, I am Augusto',
      author_id: @augusto.id
    )
    (1..5).each do |id|
      Comment.create(
        text: "Comment #{id}",
        author_id: @augusto.id,
        post_id: @post.id
      )
    end
    visit user_posts_path(@augusto)
  end

  it 'shows post\'s title' do
    expect(page).to have_content('Post 1')
  end

  it 'shows the post\'s text' do
    expect(page).to have_content('Hello World, I am Augusto')
  end

  it 'shows the post\'s number of comments' do
    expect(page).to have_content('Comments 5')
  end

  it 'shows the post\'s number of likes' do
    expect(page).to have_content('Likes 0')
  end

  it 'shows the comment\'s author' do
    expect(page).to have_content('Augusto')
  end

  it 'shows the comment\'s text' do
    expect(page).to have_content('Comment 5')
  end
end
