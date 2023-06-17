class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @beansposts = current_user.feed.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
    end
  end

  def about
  end

  def preparation
  end

end
