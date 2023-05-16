require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'User #show' do
    before do
      FactoryBot.send(:user_with_posts, posts_count: 35)
      @user = Beanspost.first.user
    end

    # it '30件表示されていること' do
    #   visit user_path @user

    #   post_wrapper =
    #     within 'ol.beansposts' do
    #       find.all('li')
    #     end
    #   expect(post_wrapper).to eq 30
    # end

    # it 'ページネーションが表示されていること' do
    #   visit user_path @user
    #   expect(page).to have_selector 'div.pagination'
    # end

    it 'Beanspostの本文がページ内に表示されていること' do
      visit user_path @user
      @user.beansposts.page(1).each do |beanspost|
        expect(page).to have_content beanspost.content
      end
    end

    # it 'ページネーションの表示が1箇所のみであること' do
    #   visit user_path @user
    #   pagination = find_all('div.pagination')
    #   expect(pagination.size).to eq 1
    # end

  end
end