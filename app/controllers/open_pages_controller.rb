
class OpenPagesController < ApplicationController

  # マイページだけログイン状態を確認する
  before_action :check_user, only: [:mypage]

  def top
  end

  def mypage
  end

  private

  def check_user
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
