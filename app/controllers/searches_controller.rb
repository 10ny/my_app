class SearchesController < ApplicationController
  before_action :logged_in_user
  
  def search
    @content = params[:content]
    @type = params[:type]
    # @roast = params[:roast]

    @beansposts = Beanspost.search_for(@content, @type)

    if @type == ""
      @type_key = "指定なし"
    elsif @type == "product_name"
      @type_key = "商品名"
    elsif @type == "shop_name"
      @type_key = "店舗名"
    elsif @type == "country"
      @type_key = "生産国"
    elsif @type == "content"
      @type_key = "コメント"
    end

  end

end
