require 'rails_helper'

RSpec.describe "Beansposts", type: :request do
  describe "#index" do
    
  end

  describe '#new' do

  end

  describe '#create' do
    context '未ログインの場合' do
      # it '投稿(登録)されないこと' do
      #   expect {
      #     post beanspost_path, params: { beanspost: { content: 'Lorem ipsum' } }
      #   }.to_not change(Beanspost, :count)
      # end

      it 'ログインページにリダイレクトされること' do
        post beansposts_path, params: { beanspost: { content: 'Lorem ipsum' } }
        expect(response).to redirect_to login_path
      end
    end
  end

  describe 'destroy' do
    let(:user) { FactoryBot.create(:other) }

    before do
      @post = FactoryBot.create(:most_recent)
    end

    context '他のユーザの投稿を削除したとき' do
      
      before do
        log_in user
      end

      it '削除されないこと' do
        expect {
          delete beanspost_path(@post)
        }.to_not change(Beanspost, :count)
      end

      # it 'ログインページにリダイレクトされること' do
      #   delete beanspost_path(@post)
      #   expect(response).to redirect_to login_path
      # end
    end

    context '未ログインお場合' do
      it '削除されないこと' do
        expect {
          delete beanspost_path(@post)
        }.to_not change(Beanspost, :count)
      end

      it 'ログインページにリダイレクトされること' do

        delete beanspost_path(@post)
        expect(response).to redirect_to login_path
      end

    end
  end
  
end
