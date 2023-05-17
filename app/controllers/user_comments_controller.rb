class UserCommentsController < ApplicationController
  before_action :set_user_comment, only: [:show, :edit, :update, :destroy]

  def new
    @user_comment = UserComment.new
    @user_comment.user_id = params[:id]
    @user = User.find(params[:id])
  end

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user = User.find_by(id: params[:user_comment][:user_id])

    respond_to do |format|
      if @user_comment.save
        format.html { redirect_to user_path(@user_comment.user_id), notice: 'You have posted a comment.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user_comment
    @user_comment = UserComment.find(params[:id])
  end

  def user_comment_params
    params.require(:user_comment).permit(:title, :comment, :ranking, :user_id)
  end
end
