class CommentsController < ApplicationController
  def index
    @comments = Comment.where(post: @post)
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
      flash[:notice] = 'Comment was published on the post!'
      redirect_to user_post_path(@post.user, @post)
    else
      flash.now[:notice] = 'Could not send your comment ,please try again!'
      render :new, locals: { comment: @comment }
    end
  end
end
