Rails.application.routes.draw do
  # 1. Deviseの行を上に移動させる（これでサインアップ画面が表示されるようになります）
  devise_for :users

  # 2. 元のコードのまま（位置だけ下にずらします）
  root 'open_pages#top'
  get "open_pages/mypage"

  # 既存のヘルスチェック用
  get "up" => "rails/health#show", as: :rails_health_check
end
