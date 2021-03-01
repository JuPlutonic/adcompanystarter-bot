# frozen_string_literal: true

# Uses Ruby-Selenium framework.
# These are all the test/task actions for "target.my.com"
# So with addition of another site support, it'd splitted into
# site specific files in "actions" folder.
# Also it'd be nice to write nnn_site_actions&properties_generator
# with empty 10 methods inside
# ------------------------------------------------

# TASK: Visit the site
# ------------------------------------------------
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
# ------------------------------------------------
def press_log_in_button
  sleep 5 # =====from 4 to 16 seconds to load page=====
  page.driver.click(1000, 26)
  sleep 3 # ==from 1 to 6 seconds to see click result==
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
  sleep 6 # ==from 2 to 6 seconds to see click result==
  failed_test # To see if you are authenticated with given password/login
end

def balans_is_negative?
  balans = page.driver.find(:xpath, @xpath_of_currency)
               .text.split("\n")
  return false if balans[30][0..-2].to_i.positive? # add gsub(' ','').to_i

  log_say('Balans is zero or negative')
  true
end

def next_task
  log_say('[PASS] Balans is positive number … ₽')
  @driver.visit('/campaign/new')
  sleep 9 # =====from 7 to 16 seconds to load page=====
end

# TASK: Try to start the ad-company
# ------------------------------------------------
def page_of_ad_company?
  # return false if page.driver.within('head > title')
  #                     .has_content?('')
  return true if page.driver.title == 'Создать кампанию'

  puts '[FAIL]'
  false
end

# targets.txt_item "traffic": put into field url and click
def start_company
  log_say('Reading file with site list')
  File.open(@targets_file) do |f|
    loop do
      break if not line = f.gets

      File.open('proceed.txt', 'a') { |d| call_write_and_click(line, d, f.lineno) }
      f.line.pop
      f.write(line.join(''))
    end
    break if balans_is_negative?

  end
end

def call_write_and_click(line, proceeded_line, line_number)
  proceeded_line.write(line)
  log_say("#{linenomber}: #{line.chomp}")
  page.driver.click(370, 300)
  p = page.driver.within(@xpath_traffic_target).fill_in 'input', with: line.chomp
  p.click
end

# def targets_emptiness_check
#   begin
#     File.delete(@targets_file) if File.readlines(@targets_file)
#   rescue Errno::EACCES
#     retry
#   end
# end
