class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(
      text: comment_params,
      user_id: current_user.id,
      post_id: @post.id
    )

    if new_comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
