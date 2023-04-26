# require 'rails_helper'

# RSpec.describe "StaticPages", type: system do
#   before do 
#     driven_by (:rack_test)
#   end

#   describe "root" do
#     it "root_path, about 2つ, contact, login 2つ へのリンクが表示されているか" do
#       visit root_path
#       link_to_about = page.find_all ("a[href=\"#{about_path}\"]")
#       link_to_login = page.find_all ("a[href=\"#{login_path}\"]")
      
#       expect(page).to have_link "Serve", href: root_path 
#       expect(link_to_about.size).to eq 2
#       expect(page).to have_link "問い合わせ", href: contact_path
#       expect(link_to_login.size).to eq 2
#     end
#   end
# end