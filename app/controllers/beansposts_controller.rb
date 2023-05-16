class BeanspostsController < ApplicationController
  before_action :logged_in_user,  only: [:index, :new, :create, :destroy]

  def index
    @beansposts = Beanspost.all.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
  end

  def new
    @beanspost = Beanspost.new
  end

  def create
    @beanspost = current_user.beanspost.build(beanspost_params)
    if @beanspost.save
      flash[:success] = "投稿しました！！"
      redirect_to root_url
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
  end


  private
    def beanspost_params
      params.require(:beanspost).permit(:content)
    end
end
