class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def new
    @profile = Profile.new
    @user = current_user
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    if @profile = current_user.profile
      @profile.update(profile_params)
      flash[:notice] = "Success"
      redirect_to profile_path(@profile)
    else
      flash.now[:notice] = "Something went wrong :("
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:bio, :image, :user_id)
  end
end
