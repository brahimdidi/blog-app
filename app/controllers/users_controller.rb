class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.last_3_posts
  end
  def new
    user = User.new
    respond_to do |format|
      format.html { render :new, locals: { user: user } }
    end
  end
end
