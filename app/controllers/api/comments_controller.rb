class Api::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments
  end

  def create
    @user = current_user
    @comment = @user.comments.new(comments_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    response = { comment: @comment } if @comment.save

    json_response(response)
  end

  def comments_params
    params.permit(:text, :post_id)
  end
end
