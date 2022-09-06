class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: [:user])
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.includes(:user)
  end

  def new
    @user = current_user
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    @user = current_user
    @post = @user.posts.new(params.require(:post).permit(:title, :text))
    if @post.save
      flash[:success] = 'Question saved successfully'
      redirect_to user_posts_path(@user)
    else
      flash.now[:error] = 'Error:Post could not be saved'
      render :new, locals: { post: @post }
    end
  end
end
