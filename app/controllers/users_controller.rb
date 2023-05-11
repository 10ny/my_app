class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  
  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session  #セッション固定攻撃対策のためログイン前にリセットすること
      log_in @user
      flash[:success] = "登録が完了しました！！"
      redirect_to @user
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新しました。"
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :passwprd_comfirmation)
    end

    # beforeフィルター

    #ログイン済みユーザか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインが必要です。"
        redirect_to login_url, status: :see_other
      end
    end

end
