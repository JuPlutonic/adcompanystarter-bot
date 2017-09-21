require 'nokogiri' # Web parser. CSS/XPath selectors.
# require 'capybara-webkit'
# require 'capybara/dsl'
require 'open-uri'
require_relative 'output.rb' # To use in #collect method: xlsx/csv export

PAGE_URL = "http://target-sandbox.my.com" # Development
# For work in production please set PAGE_URL = "https://target.my.com" #  Добавить константу для пути "/ads/campaigns/new"

# Use ARGV0 for login
# Use ARGV1 for password
# Use ARGV2 for mobile_site
# And gets for name

class Crawler

def sign_in (login, password)
  page = Nokogiri::HTML(open(PAGE_URL))
end

  def company_start
  end

  public

  #def collect

    # Saves app_id
    # Collects placement # array
    # Collects ad_unit # array

  #end
end
