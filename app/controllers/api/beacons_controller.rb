class API::BeaconsController < API::APIController
  def index
    @beacons = current_user.beacons
  end

  def show
    @beacon = Beacon.find_by!(major_minor: params[:major_minor])
  end

  def update
    @beacon = current_user.beacons.find_by!(major_minor: params[:major_minor])

    if @beacon.update(beacon_params)
      render :show
    else
      render json: @beacon.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def beacon_params
    params.require(:beacon).permit(:status)
  end
end
