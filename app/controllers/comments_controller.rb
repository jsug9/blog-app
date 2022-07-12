class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comments_params)
    @comment.author_id = current_user
    @comment.post_id = @post

    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
