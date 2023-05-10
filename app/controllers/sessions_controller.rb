class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #user && user.authenticate(params[:session][:password])の省略形
    if user&.authenticate(params[:session][:password])
      reset_session  #セッション固定攻撃対策のためログイン前にリセットすること
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      log_in user
      flash[:success] = "ログインしました。"
      redirect_to user
    else
      flash.now[:danger] = "メールアドレス または パスワード が間違っています。"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = "ログアウトしました。"
    redirect_to root_url, status: :see_other
  end

end
