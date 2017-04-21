class API::ActivationsController < API::APIController
  before_action :set_beacon, only: [:create]

  def create
    if @beacon.activate(current_user, beacon_params[:code])
      render 'api/beacons/show', status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    @beacon = Beacon.find_by_major_minor_string!(params[:beacon_major_minor])
  end

  # Only allow a trusted parameter "white list" through.
  def beacon_params
    params.require(:beacon).permit(:code)
  end
end
