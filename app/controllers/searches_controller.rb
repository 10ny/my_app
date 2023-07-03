class SearchesController < ApplicationController
  before_action :logged_in_user
  
  def search
    @content = params[:content]
    @type = params[:type]

    @beansposts = Beanspost.search_for(@content, @type) 
  end

end
