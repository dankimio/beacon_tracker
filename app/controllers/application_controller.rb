class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout -> { devise_controller? ? 'admin' : false }

  protected

  def after_sign_in_path_for(_)
    admin_beacons_path
  end

  def after_sign_out_path_for(_)
    new_admin_session_path
  end
end
