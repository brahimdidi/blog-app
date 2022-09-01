class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end
  def new 
   @user = current_user
   post = Post.new
   respond_to do |format|
      format.html { render :new, locals: { post: post } }
   end
  end
end
