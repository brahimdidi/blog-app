class UsersController < ApplicationController
  def index
    unless current_user.nil?
      @users = User.all.where.not(id: current_user.id).includes(:posts);
    end
  end

  def show
    @user = User.friendly.find(params[:id])
    @recent_posts = @user.last_3_posts
  end
end
