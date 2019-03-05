# frozen_string_literal: true

# Uses Ruby-Selenium framework.
# These are all the test/task actions for "target.my.com"
# So with addition of another site support, it'd splitted into
# site specific files in "actions" folder.
# Also it'd be nice to write nnn_site_actions&properties_generator
# with empty 10 methods inside
# --------------------------------------------------------------------

# TASK: Visit the site
# --------------------------------------------------------------------
# Pull in the action title that the Script refers to.
def test_task_title(callee)
  log_say("................\nTest/Task #{callee}") # ad_starter_properties
end

# Fetch the page URL to use and open it.
# When it's no connection you will see message "Chrome process did
# not produce websocket url within 1 seconds (RuntimeError)"
def test_page_url
  Capybara.app_host = @test_url # @test_url in ad_starter_properties
  @driver.visit('/')
  log_say("Connection … #@test_url visited") # ad_starter_global_methods
end

# Check the web page title is as expected.
def validate_page_title
  if @driver.title != @expected_result
    failed_test # ad_starter_global_methods
    validation_message = "[FAIL] Title was #{@driver.title}, but we expected #@expected_result"
  else
    validation_message = '[PASS] Title was as expected'
  end
  log_say(validation_message)
end

# TASK: Try to sign in to the site
# --------------------------------------------------------------------
def press_log_in_button
  sleep 5
  page.driver.click(1000, 26)
  sleep 1
end

# Check content on Sign in form
def check_sign_in_form
  if page.driver.has_css?(@css_of_sign_in_popup) # ad_starter_properties
    validation_message = '[PASS] The log in form is presented'
  else
    failed_test # ad_starter_global_methods
    validation_message = '[FAIL] No sign in text in demanded selector'
  end
  log_say(validation_message)
end

# Apply in 'Sign in' form and submit
def submit_sign_in_form
  page.driver.within(@css_of_sign_in_popup)
      .fill_in 'login',    with: @env_login
  page.driver.within(@css_of_sign_in_popup)
      .fill_in 'password', with: @env_password
  page.driver.click(336, 550)
  sleep 5
  failed_test # To see if you are authenticated with given password/login
end

def balans_empty?
  balans = page.driver.find(:xpath, @xpath_of_currency)
               .text.split("\n")
  if balans[30][0..-2].to_i.positive?
    log_say('[PASS] Balans is not empty … ₽')
    return false
  else
    log_say('Balans is empty')
    return true
  end
end

def next_task
  page.driver.visit('/campaign/new')
  sleep 1
end

# TASK: Try to start the ad-company
# --------------------------------------------------------------------
def page_of_ad_company?; end

def start_company; end
