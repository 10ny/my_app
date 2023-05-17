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

  # describe 'home' do
  #   before do
  #     FactoryBot.send(:user_with_posts, posts_count: 35)
  #     @user = Beanspost.first.user
  #     @user.password = 'password'
  #     log_in @user
  #     visit root_path
  #   end
  
  #   it 'ページネーションのラッパータグがあること' do
  #     expect(page).to have_selector 'div.pagination'
  #   end
  
  #   context '有効な送信の場合' do
  #     it '投稿されること' do
  #       expect {
  #         fill_in 'コメント', with: 'This micropost really ties the room together'
  #         click_button '投稿'
  #       }.to change(Micropost, :count).by 1
  
  #       expect(page).to have_content 'This micropost really ties the room together'
  #     end
  #   end
  
  #   context '無効な送信の場合' do
  #     it 'contentが空なら投稿されないこと' do
  #       fill_in 'beanspost_content', with: ''
  #       click_button '投稿'
  
  #       expect(page).to have_selector 'div#error_explanation'
  #       expect(page).to have_link '2', href: '/?page=2'
  #     end
  #   end
  
      # it '投稿数が"35 microposts"と表示されること' do
      #   expect(page).to have_content '35 microposts'
      # end
      
      # it '0件なら"0 microposts"、1件なら"1 micropost"と表示されること' do
      #   @user.microposts.destroy_all
      #   visit current_path
      #   expect(page).to have_content '0 microposts'
      
      #   fill_in 'micropost_content', with: 'test post'
      #   click_button 'Post'
      #   expect(page).to have_content '1 micropost'
      # end

  #   describe '削除機能' do
  #     it 'deleteボタンが表示されていること' do
  #       expect(page).to have_link '削除'
  
  #       fill_in 'beanspost_content', with: 'This micropost really ties the room together'
  #       click_button '投稿'
  
  #       post = Beanspost.first
  
  #       expect {
  #         click_link '削除', href: beanspost_path(post)
  #       }.to change(Beanspost, :count).by -1
  #       expect(page).to_not have_content 'This micropost really ties the room together'
  #     end
  
  #     it '他のユーザのプロフィールではdeleteボタンが表示されないこと' do
  #       @other_user = FactoryBot.create(:other)
  #       visit user_path(@other)
  #       expect(page).to_not have_link '削除'
  #     end
  #   end
  # end
end