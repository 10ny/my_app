class UsersController < ApplicationController
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

  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :passwprd_comfirmation)
    end

end
