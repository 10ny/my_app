class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session  #セッション固定攻撃対策のためログイン前にリセットすること
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "メールアドレス または パスワード が間違っています。"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy

  end

end
