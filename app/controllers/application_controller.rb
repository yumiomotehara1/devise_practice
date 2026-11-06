
class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    open_pages_mypage_path
  end

  # サインアップ後の遷移先
  def after_sign_up_path_for(resource)
    open_pages_mypage_path
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  # 名前の保存を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
