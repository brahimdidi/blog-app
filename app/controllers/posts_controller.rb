class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts.includes(comments: [:user]).order('created_at DESC')
    @pagy, @posts = pagy(@user.posts.includes(comments: [:user]).order('created_at DESC'), items: 20)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.includes(:user)
  end

  def all_posts
    @pagy, @posts = pagy(Post.all.includes(comments: [:user]).order('created_at DESC'), items: 20)
    @user = current_user
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
      flash[:notice] = 'Post was saved successfully'
      redirect_to user_posts_path(@user)
    else
      flash.now[:notice] = 'Error:Post could not be saved'
      render :new, locals: { post: @post }
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    post.comments.destroy_all if post.comments.any?
    post.likes.destroy_all if post.likes.any?
    post.destroy
    if user.save
      redirect_to user_posts_path, notice: 'Post was successfully deleted.'
    else
      render :new, alert: 'Error can not delete this post,try again'
    end
  end
end
