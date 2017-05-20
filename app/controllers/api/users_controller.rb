class API::UsersController < API::APIController
  skip_before_action :restrict_access!, only: [:create, :authenticate]
  before_action :set_user, only: [:show, :update]

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def authenticate
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      render :show
    else
      head :unauthorized
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
