require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    let (:base_title) {"Serve"}

    context '引数がある場合' do
      it '引数を加えたタイトルが表示されるか' do
        expect(full_title('Page Title')).to eq "Page Title | #{base_title}"
      end
    end

    context '引数がない場合' do
      it 'ベースタイトルのみが表示されるか' do
        expect(full_title).to eq "#{base_title}"
      end
    end
  end
end