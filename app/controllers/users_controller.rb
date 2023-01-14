class UsersController < ApplicationController
  def index
    return if current_user.nil?

    @users = User.all.where.not(id: current_user.id).includes(:posts)
  end

  def show
    @user = User.friendly.find(params[:id])
    @recent_posts = @user.last_3_posts
  end
end
