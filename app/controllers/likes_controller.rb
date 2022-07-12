class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if already_liked?
      redirect_to user_post_path(@user.id, @post)
    else
      new_like = current_user.likes.new(
        user_id: current_user.id,
        post_id: @post.id
      )
      redirect_to user_post_path(@user.id, @post) if new_like.save
    end
  end

  def already_liked?
    Like.where(author_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
