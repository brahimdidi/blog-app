class PostsController < ApplicationController
  before_action :set_current_user, only: %i[all_posts new create destroy]
  before_action :set_post, only: %i[show destroy]

  def index
    @user = User.friendly.find(params[:user_id])
    # @posts = @user.posts.includes(comments: [:user]).order('created_at DESC')
    @pagy, @posts = pagy(@user.posts.includes(comments: [:user]).order('created_at DESC'), items: 20)
    show_new_pages
  end

  def show
    @user = @post.user
    @comments = @post.comments.includes(:user).limit(10)
  end

  def all_posts
    @pagy, @posts = pagy(Post.all.includes(comments: [:user]).order('created_at DESC'), items: 20)
    show_new_pages
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
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
    @post.comments.destroy_all if @post.comments.any?
    @post.likes.destroy_all if @post.likes.any?
    @post.destroy
    if @user.save
      flash[:notice] = 'Post was successfully deleted.'
      redirect_to user_posts_path(@user)
    else
      render :new, alert: 'Error can not delete this post,try again'
    end
  end

  # this method allows to show new pages when the user scrolls downk
  def show_new_pages
    render 'scrollable_list' if params[:page]
  end

  # this method sets the current user

  private

  def set_current_user
    @user = current_user
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
