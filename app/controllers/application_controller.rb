class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Deviseのコントローラーが動くときに、カスタムパラメーターを許可する設定を呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # サインアップ・ログイン後にマイページ（mypage）へ遷移させる
  def after_sign_in_path_for(resource)
    open_pages_mypage_path
  end

  # ログアウト後にトップ画面（root）へ遷移させる
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  # 新規登録（sign_up）のときに、name カラムの保存を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
