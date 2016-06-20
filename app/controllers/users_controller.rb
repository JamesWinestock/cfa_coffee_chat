class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def new
    @user = User.new
  end

  def index
    @users = User.all.order(created_at: :desc)
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      @profile = Profile.new
      @profile.user_id = @user.id
      @profile.save
      redirect_to profile_path(@user.profile)
    else
      render :new
    end
  end

  def users_list
    if params[:search]
      @users = User.where("username LIKE ?","%#{params[:search]}%")
    else
      @users = User.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
