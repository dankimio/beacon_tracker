class API::ActivationsController < API::APIController
  before_action :set_beacon, only: [:create]

  def create
    if @beacon.update(beacon_params)
      render 'api/beacons/show', status: :created
    else
      render json: @beacon.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = Beacon.find_by_major_minor_string!(params[:beacon_major_minor])
  end

  # Only allow a trusted parameter "white list" through.
  def beacon_params
    params.require(:beacon).permit(:entered_code).merge(user: current_user)
  end
end
