# Uses Ruby-Selenium framework.

# These are the Global Methods for system / testing purposes.
# If there were a large number, we'd split these into separate files.
# --------------------------------------------------------------------

def setup
  @driver = Selenium::WebDriver.for @web_driver_to_use # ad_starter_properties.rb
end # setup

def teardown
  @driver.quit
  date_and_time
  @test_log.puts("\n................\n\nTest Run Ended on #{@time_right_now}")
  @test_log.close
end # teardown

# Define a consistent way to create Date and Time for files, errors, etc.
def date_and_time
  @time_right_now = Time.now.strftime('%d-%m-%Y at %H-%M-%S')
end # date_and_time

def failed_test # Defines what we want to see happen when a test script fails
  date_and_time # ad_starter_global_methods
  test_fail_time = @time_right_now # ad_starter_global_methods > date_and_time
  @driver.save_screenshot "./Test-Fail - #{test_fail_time}.png"
end

def log_generation
  date_and_time # ad_starter_global_methods
  @test_log_time = @time_right_now # ad_starter_global_methods > date_and_time
  @test_log = File.open("Test Log - #{@test_log_time}.txt", 'w')

  @test_log.puts("                   Test Log: #{@test_log_time}\n")
  @test_log.puts('.........................................' \
    ".........................\n\n") # Better than concatenate
end # log_generation
