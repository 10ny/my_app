class BookmarksController < ApplicationController
before_action :logged_in_user

  def create
    @beanspost = Beanspost.new(params[:beanspost_id])
    current_user.bookmark(@beanspost)
    respond_to do |format|
      format.html { redirect_to @beanspost }
      format.turbo_stream
  end

  def destroy
    @beanspost = current_user.bookmarks.find(params[:beanspost_id]).beanspost
    @beasnpost.destroy
    respond_to do |format|
      format.html { redirect_to @beanspost }
      format.turbo_stream
  end
end
