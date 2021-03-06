require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(name: 'Aaron', photo: 'photo', bio: 'Hey folks!', post_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.new(post: @post, author: @user, text: 'text 1')
    @comment.save
  end

  describe 'Like Model Properties' do
    it 'author_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end

    it 'post_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end
  end
end
