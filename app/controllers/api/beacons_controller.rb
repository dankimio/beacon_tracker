class API::BeaconsController < API::APIController
  before_action :set_beacon, only: [:show, :update]

  def index
    @beacons = Beacon.all
  end

  def show
  end

  def update
    if @beacon.update(beacon_params)
      render json: @beacon
    else
      render json: @beacon.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = Beacon.find_by_major_minor_string!(params[:major_minor])
  end

  # Only allow a trusted parameter "white list" through.
  def beacon_params
    params.require(:beacon).permit(:status)
  end
end
