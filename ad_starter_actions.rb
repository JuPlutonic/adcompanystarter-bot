# Uses Ruby-Selenium framework.

# These are all the test/task actions.
# Once there are a large number, we'd split them out into logical sets.
# --------------------------------------------------------------------

# Pull in the action title that the Script refers to.
def test_task_title
  puts @originalActionTitle # ad_starter_properties
end # test_title

# Fetch the page URL to use and open it.
def test_page_url
  @driver.get @testUrl # ad_starter_properties
end # get_page_url

# Check the web page title is as expected.
def validate_page_title
  if @driver.title != @expectedResult
    failedTest # ad_starter_global_methods
    fail_message = "[FAIL] Title was #{@driver.title}, but we expected #{@expectedResult}"
    puts fail_message
    @testLog.puts("#{@originalActionTitle} \n #{fail_message}")
  else
    pass_message = '[PASS] Title was as expected'
    puts pass_message
    @testLog.puts("#{@originalActionTitle} \n #{pass_message}")
  end
end
