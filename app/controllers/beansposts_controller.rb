class BeanspostsController < ApplicationController
  before_action :logged_in_user,  only: [:index, :new, :create, :destroy]
  before_action :correct_user,    only: :destroy

  def index
    @beansposts = Beanspost.all.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
  end

  def new
    @beanspost = Beanspost.new
  end

  def create
    @beanspost = current_user.beansposts.build(beanspost_params)
      # if @beanspost.image.nil?
      #   @beanspost.image = "default_post.png"#デフォルトで画像を設定
      # end
    @beanspost.image.attach(params[:beanspost][:image])
    if @beanspost.save
      flash[:success] = "投稿しました！！"
      redirect_to root_url
    else
      # @feed_items = current_user.feed.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
      render "new", status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
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


  private
    def beanspost_params
      params.require(:beanspost).permit(:product_name, :roast, :country, :shop_name, :grams, :price, :date, :brew, :roaster, :content, :image)
    end

    def correct_user
      @beanspost = current_user.beansposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @beanspost.nil?
    end
end
