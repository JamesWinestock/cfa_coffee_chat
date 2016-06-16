class LocationsController < ApplicationController

  def show
    @profile = current_user.profile
    @location = Location.find(params[:id])
  end

  def create
    @location = @locationable.locations.build(location_params)
    @location.user_id = current_user.id
    if @location.save
      redirect_to @locationable
    end
  end

  private

  def location_params
    params.require(:location).permit(:user_id, :address, :suburb, :state, :country, :postcode, :latitude, :longitude)
  end
end
