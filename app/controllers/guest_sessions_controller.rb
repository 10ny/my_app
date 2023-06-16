class GuestSessionsController < ApplicationController

  def create
    user = User.find_by(email: "guest@example.com")
    log_in user
    flash[:success] = "ゲストユーザーとしてログインしました。"
    redirect_to user
  end

end
