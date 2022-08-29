class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show 
    @user = User.find(params[:id])
  end
  def new
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end
end
