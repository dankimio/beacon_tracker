class Admin::AdminsController < Admin::AdminController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_admins_url, notice: t('.notice')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      redirect_to admin_admins_url, notice: t('.notice')
    else
      render :new
    end
  end

  def destroy
    @admin.destroy
    redirect_to admin_admins_url, notice: t('.notice')
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
