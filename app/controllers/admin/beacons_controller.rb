class Admin::BeaconsController < Admin::AdminController
  before_action :authenticate_admin!
  before_action :set_beacon, only: [:edit, :update, :destroy]

  def index
    @beacons = Beacon.all
  end

  def new
    @beacon = Beacon.new
  end

  def create
    @beacon = Beacon.new(new_beacon_params)

    if @beacon.save
      redirect_to admin_beacons_url, notice: t('.notice')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @beacon.update(edit_beacon_params)
      redirect_to admin_beacons_url, notice: t('.notice')
    else
      render :new
    end
  end

  def destroy
    @beacon.destroy
    redirect_to admin_beacons_url, notice: t('.notice')
  end

  private

  def set_beacon
    @beacon = Beacon.find(params[:id])
  end

  def new_beacon_params
    params.require(:beacon).permit(:major, :minor, :passcode)
  end

  def edit_beacon_params
    params.require(:beacon).permit(:passcode)
  end
end
