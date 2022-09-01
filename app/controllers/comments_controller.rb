class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post: @post)
  end
  def new
    @post = Post.find(params[:user_id])
    @user = current_user
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
   end
  end

  def create

  end
end
