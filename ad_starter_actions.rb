# Uses Ruby-Selenium framework.

# These are all the test/task actions.
# Once there are a large number, we'd split them out into logical sets.
# --------------------------------------------------------------------

# TASK: Visit the site
# --------------------------------------------------------------------
# Pull in the action title that the Script refers to.
def test_task_title(callee)
  puts "Test/Task #{callee}" # ad_starter_properties
end # test_title

# Fetch the page URL to use and open it.
def test_page_url
  @driver.get @test_url # ad_starter_properties
end # get_page_url

# Check the web page title is as expected.
def validate_page_title
  if @driver.title != @expected_result
    failed_test # ad_starter_global_methods
    validation_message =
      "[FAIL] Title was #@driver.title, but we expected #@expected_result"
  else
    validation_message = '[PASS] Title was as expected'
  end
  puts validation_message
  @test_log.puts("#@original_action_title \n #{validation_message}")
end

# TASK: Try to sign in to the site
# --------------------------------------------------------------------
def press_log_in_button
  @driver.find_element(:xpath, "//*[@id='portal-headline']/div/div[3]/div/span/span/span[2]/span").click
end

def check_sign_in_form
  if @driver.find_element(:xpath, "/html/body/div[6]/div/div[2]/div/div[2]/span").text != 'Sign in'
    failed_test # ad_srarter_global_methods
    validation_message = '[FAIL] No sign in text in demanded selector'
  else
    validation_message = '[PASS] The log in form is presented'
  end
  puts validation_message
  @test_log.puts("#@original_action_title \n #{validation_message}")
end

def submit_sign_in_form

end
