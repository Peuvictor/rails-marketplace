class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @shirts = @user.shirts
  end

  private

  def set_user
    @user = User.find(params[:id])
    unless @user
      redirect_to root_path, alert: 'User not found'
    end
  end
end


