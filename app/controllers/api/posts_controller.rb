class Api::PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

    if @posts.empty?
      render json: { message: 'No posts yet' }, status: :not_found
    else
      render json: @posts
    end
  end

  def show
    @post = Post.find(params[:id])

    if @post.nil?
      render json: { message: 'Post not found' }, status: :not_found
    else
      render json: @post
    end
  end

 
end