class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: %i[show edit update destroy]

  def new
    @post_comment = PostComment.new
    @post_comment.post_id = params[:id]
    @post = Post.find(params[:id])
  end

  def create
    @post_comment = current_user.post_comments.build(post_comment_params)
    @post = @post_comment.post

    if @post_comment.save
      redirect_to post_url(@post), notice: "You have posted a comment."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post_comment
    @post_comment = PostComment.find(params[:id])
  end

  def post_comment_params
    params.require(:post_comment).permit(:title, :comment, :ranking, :post_id)
  end

  
end
