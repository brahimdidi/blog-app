class Api::UsersController < ApplicationController
  # before_action :authorize_request, except: :create

  def index
    @users = User.all

    if @users.empty?
      render json: { message: 'No users yet' }, status: :not_found
    else
      render json: @users
    end
  end

  def show
    @user = User.find(params[:id])

    if @user.nil?
      render json: { message: 'No user found' }, status: :not_found
    else
      render json: @user
    end
  end
end
