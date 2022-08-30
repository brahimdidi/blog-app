class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments
  end

  def show; end
end
