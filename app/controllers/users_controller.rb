class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new((user_params))
    if @user.save
      aa
    else
      render "new", status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :passwprd_comfirmation)
    end

end
