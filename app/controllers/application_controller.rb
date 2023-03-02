class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    rooms_after_login_path
  end

#  def after_sign_out_path_for(resource)
#    root_path
#  end
#

#deviseにて新規登録時、デフォルトに無いカラム（email,password以外）の保存許可の指示
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name introduction image))
  end
  
end
