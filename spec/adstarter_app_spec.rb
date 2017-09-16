# # When you use capybara, poltergeist and phantom.js testing is pretty easy:
# Capybara.default_driver = :poltergeist
# Capybara.app_host = 'https://target-sandbox.my.com/ads/campaigns/new' # Development
# # For work in production please set app_host = "https://target.my.com/ads/campaigns/new"
# describe 'Ad-company-starter App' do
#   context 'visit root' do
#     before { visit '/' }
#     it 'displays campaigns (default)' do
#       expect(page).to have_content 'Campaigns'
#     end
#     it "displays 'Sign out'" do
#       expect(page).to have_css('p', text: 'Sign out'')
#     end
#     it 'displays table element that has a row with 3 columns' do
#       expect(page).to have_selector(:xpath, '//table//tr[count(td)=3]')
#     end
#     it 'column 1 should have the thumbnail inside img tag inside a link tag' do
#       expect(page).to have_selector(:xpath, '//table//tr/td[1]//a//img')
#     end
#     it 'title should be inside a second column inside a link tag' do
#       expect(page).to have_selector(:xpath, '//table//tr/td[2]//a')
#     end
#   end
# end
require_relative "../crawler"

require "Capybara"
require "Capybara/cucumber"
require "rspec"

World do
  Capybara.app = ad-company-starter

#  include Capybara::DSL
  include RSpec::Matchers
end
