class BeanspostsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,    only: [:edit, :update, :destroy]

  def index
    @beansposts = Beanspost.all.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
    # @beanspost = Beanspost.find(params[:id])
  end

  def show
    @beanspost = Beanspost.find(params[:id])
  end

  def new
    @beanspost = Beanspost.new
  end

  def create
    @beanspost = current_user.beansposts.build(beanspost_params)
    @beanspost.image.attach(params[:beanspost][:image])
    if @beanspost.save
      flash[:success] = "投稿しました！！"
      redirect_to root_url
    else
      # @feed_items = current_user.feed.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
      render "new", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @beanspost.update(beanspost_params)
      flash[:success] = "更新しました。"
      redirect_to @beanspost
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @beanspost.destroy
    flash[:success] = "投稿を削除しました"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  # ブックマークした投稿の一覧表示用のグローバル変数定義
  def bookmarks
    @beansposts = current_user.bookmarks_beansposts
  end


  private
    def beanspost_params
      params.require(:beanspost).permit(:product_name, :roast, :country, :shop_name, :grams, :price, :date, :brew, :roaster, :content, :image)
    end

    def correct_user
      @beanspost = current_user.beansposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @beanspost.nil?
    end
end
