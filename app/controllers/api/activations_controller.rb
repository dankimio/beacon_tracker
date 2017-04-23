class API::ActivationsController < API::APIController
  before_action :set_beacon, only: [:create]

  def create
    if @beacon.update(user: current_user)
      render 'api/beacons/show', status: :created
    else
      render json: @beacon.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = Beacon.where(beacon_params.merge(user: nil)).find_by!(params[:major_minor])
  end

  # Only allow a trusted parameter "white list" through.
  def beacon_params
    params.require(:beacon).permit(:passcode)
  end
end
