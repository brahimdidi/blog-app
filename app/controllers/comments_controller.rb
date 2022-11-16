class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post: @post).includes(:user)
  end

  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user_id = @user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = 'You just commented on this post'
      redirect_to user_post_path(@post.user, @post)
    else
      flash.now[:notice] = 'Could not send your comment ,please try again!'
      render :new, locals: { comment: @comment }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = Post.find(params[:post_id])
    comment.destroy
    if post.save
      redirect_to request.referrer, notice: 'Comment was successfully deleted.'
    else
      render :new, alert: 'Error can not delete deleting the comment'
    end
  end
end
