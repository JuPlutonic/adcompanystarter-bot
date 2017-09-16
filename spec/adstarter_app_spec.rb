# # When you use (require) gem 'shoulda' with these matchers you can make many tricks:
# it { should validate_presence_of :name }
# it { should validate_presence_of :url }
# it { should validate_presence_of :platform_id }
# it { should validate_presence_of :block_types }
# it { should validate_numericality_of(:platform_id).only_integer.is_greater_than(0)

# # When you use mechanize there are methods testcase module:
# require 'mechanize/test_case'
# class RedirectLimitReachedError < Mechanize::TestCase
#   def test_to_s
#     app_host = 'https://target-sandbox.my.com/ads/campaigns/new' # Development
#     # For work in production please set app_host = "https://target.my.com/ads/campaigns/new"
#     error = Mechanize::ElementNotFoundError.new(app_host, :element, :conditions)
#     assert_match(/Campaigns/, error.to_s)
#   end
# end

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
