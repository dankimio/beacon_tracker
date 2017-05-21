class API::LocationsController < API::APIController
  before_action :set_beacon, only: [:create]

  def index
    beacon = current_user.beacons.find_by!(major_minor: params[:beacon_major_minor])
    @locations = beacon.locations
  end

  def create
    @location = @beacon.locations.build(location_params)

    if @location.save
      render :show, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def set_beacon
    @beacon = Beacon.find_by!(major_minor: params[:beacon_major_minor])
  end

  def location_params
    params
      .require(:location)
      .permit(:latitude, :longitude)
      .merge(user: current_user)
  end
end
