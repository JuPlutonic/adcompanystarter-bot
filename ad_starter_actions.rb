# Uses Ruby-Selenium framework.

# These are all the test/task actions.
# Once there are a large number, we'd split them out into logical sets.
# --------------------------------------------------------------------

# Pull in the action title that the Script refers to.
def test_task_title
  puts @original_action_title # ad_starter_properties
end # test_title

# Fetch the page URL to use and open it.
def test_page_url
  @driver.get @test_Url # ad_starter_properties
end # get_page_url

# Check the web page title is as expected.
def validate_page_title
  if @driver.title != @expected_result
    failedTest # ad_starter_global_methods
    validation_message =
      "[FAIL] Title was #{@driver.title}, but we expected #{@expected_result}"
  else
    validation_message = '[PASS] Title was as expected'
  end
  puts validation_message
  @testLog.puts("#{@original_action_title} \n #{validation_message}")
end
