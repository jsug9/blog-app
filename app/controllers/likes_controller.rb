class LikesController < ApplicationController
  def create
    puts 'I am in the create method'
    @user = current_user
    @post = Post.find(params[:post_id])
    if already_liked?
      redirect_to user_post_path(@user, @post)
    else
      @like = @user.likes.new
      @like.author_id = @user.id
      @like.post_id = params[:post_id]
      redirect_to user_post_path(@user, @post) if @like.save
    end
  end

  def already_liked?
    Like.where(author_id: @user.id, post_id: @post.id).exists?
  end
end
