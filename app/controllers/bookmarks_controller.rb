class BookmarksController < ApplicationController
before_action :logged_in_user

  def index
    # 一覧ページ表示用アクション
  end

  def create
    @beanspost = Beanspost.find(params[:beanspost_id])
    current_user.bookmark(@beanspost)
    respond_to do |format|
      format.html { redirect_to @beanspost }
      format.turbo_stream
    end
  end

  def destroy
    @beanspost = current_user.bookmarks_beansposts.find(params[:beanspost_id])
    current_user.unbookmark(@beanspost)
    respond_to do |format|
      format.html { redirect_to @beanspost }
      format.turbo_stream
    end
  end
end
