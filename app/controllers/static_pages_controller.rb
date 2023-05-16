class StaticPagesController < ApplicationController
  def home
    @beansposts = Beanspost.all.page(params[:page]).per(12) # ページネーションはポスト12個ごとの表示に設定
    @beanspost = current_user.beansposts.build if logged_in?
  end

  def about
  end

  def contact
  end
end
