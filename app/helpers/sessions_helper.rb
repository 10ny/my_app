module SessionsHelper

  #渡されたユーザー情報でログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  #現在ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #ユーザーがログインしていればtrue、それ以外はfalseを返す
  def logged_in?
    !current_user.nil?
  end

  #セッションをリセットcurrent_userをnilにしてログアウト
  def log_out
    reset_session
    @current_user = nil  #安全のため
  end
end
