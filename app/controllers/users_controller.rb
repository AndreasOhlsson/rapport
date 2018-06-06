class UsersController < ApplicationController 
  before_action :authenticate_user!

  def index
    @users = User.all
    @activated_users = User.where(deactivated: false)
    @deactivated_users = User.where(deactivated: true)
  end

  def activate_user
    @user = User.find(params[:id])
    @user.update(deactivated: false)

    redirect_to users_url
  end

end
