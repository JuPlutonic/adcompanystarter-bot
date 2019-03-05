# frozen_string_literal: true

# The data for the elements below are hard coded for this example.
# Usually they'd be parameters in abstract Excel files or a database.
# -------------------------------------------------------------------

# start with global configuration (JS_DRIVER was chrome)
@browser = :headless_chrome
@log_level = 'debug'
@base_url = @test_url
@js_driver = :cuprite

# Site specific:
# --------target-sandbox.my.com & target.my.com------------
@expected_result = 'Target.my.com' # <-- Change this to BREAK the test
@css_of_sign_in_popup = 'body > div.bubble-ts.bubble-ts_my-com > div > div.bubble-ts__content.js-bubble-content > div > div:nth-child(2)'
@xpath_of_currency = '/html/body/div[1]/div[2]/div[1]/div/div[1]/div[1]/div[2]/div/div[2]'
# Example.
# How to run script with login and password:
#   TARG_ENV=qa TARG_LOGIN=john@mail.io TARG_PWD=12345678 ruby crawler.rb
@env_type = ENV['TARG_ENV'].to_s     || 'error' # Set it before run crawler.rb
@env_login = ENV['TARG_LOGIN'] .to_s || 'error' # Set it before run crawler.rb
@env_password = ENV['TARG_PWD'].to_s || 'error' # Set it before run crawler.rb
case @env_type # environments (production qa/api)
when 'qa'
  @test_url = 'https://target-sandbox.my.com/'
when 'production'
  @test_url = 'https://target.my.com/'
end
