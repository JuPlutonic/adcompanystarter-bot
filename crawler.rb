require 'rubygems' # Bundle gems
require 'mechanize' # Check for relevant forms and buttons and manipulate
require 'nokogiri' # Web parser. CSS/XPath selectors.
require 'open-uri'
require_relative 'output.rb' # To use in #collect method: xlsx/csv export

#PAGE_URL = "https://target-sandbox.my.com/ads/campaigns/new" #Development
#Production is PAGE_URL = "https://target.my.com/ads/campaigns/new"

# Use ARGV0 for login
# Use ARGV1 for password
# Use ARGV2 for mobile_site
# And gets for name

class Crawler

  #def sign_in (login, password)
  #end

  def company_start
  end

  public

  #def collect

    # Saves app_id
    # Collects placement # array
    # Collects ad_unit # array

  #end
end
