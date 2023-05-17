class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @beansposts = Beanspost.all.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
      @beanspost = current_user.beansposts.build
      @feed_items = current_user.feed.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
    end
  end

  def about
  end

  def contact
  end
end
