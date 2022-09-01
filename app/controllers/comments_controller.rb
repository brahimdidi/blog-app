class CommentsController < ApplicationController
  def new
    @user = current_user
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
   end
  end

  def create
  end
end
