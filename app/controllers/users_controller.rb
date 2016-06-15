class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      @profile = Profile.new
      @profile.user_id = @user.id
      @profile.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
