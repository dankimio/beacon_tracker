class Admin::BeaconsController < Admin::AdminController
  def index
    @beacons = Beacon.all
  end

  def new
    @beacon = Beacon.new
  end

  def create
    @beacon = Beacon.new(beacon_params)

    if @beacon.save
      redirect_to admin_beacons_url, notice: 'Beacon was successfully created'
    else
      render :new
    end
  end

  private

  def beacon_params
    params.require(:beacon).permit(:major, :minor, :code)
  end
end
