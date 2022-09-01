class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: comment } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.user_id = @user.id
    @comment.post_id = @post.id
    if @comment.save
      flash[:notice] = 'Comment successfully created!'
      redirect_to user_posts_url(@user, @post)
    else
      flash.now[:error] = 'Comment cannot be created!'
      render :new, locals: { comment: @comment }
    end
  end
end
