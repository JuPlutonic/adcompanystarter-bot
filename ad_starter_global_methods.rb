# frozen_string_literal: true

# Uses Ruby-Selenium framework.
# These are the Global Methods for system / testing purposes.
# If there were a large number, we'd split these into separate files.
# -------------------------------------------------
require 'capybara/rspec'
require 'capybara/cuprite'
include Capybara::DSL

# Implement exception handling if end-user don't have *needed*-WebDriver
# in the $PATH.
# options move to ad_starter_properties.rb
def setup
  RSpec.configure do
    @driver = Capybara.register_driver @js_driver do |app|
      Capybara::Cuprite::Driver
        .new app,
             browser: @browser,
             options: %w[headless disable-gpu window_size: [1024, 768]]
    end
    Capybara.current_driver    = @js_driver
    Capybara.javascript_driver = @js_driver
    # With this line you could remove all sleeps connected to clicks:
    # @driver.manage.timeouts.implicit_wait = 2
  end
end

def teardown
  # @driver.quit # TODO now it'is unapplicable next
  # line here is to see that's happen
  date_and_time #                    ad_starter_global_methods
  @test_log.puts("\n................\n\nTask/Test Ended on #@time_right_now")
  # @test_log.close
end

# Define a consistent way to create Date and Time for files, errors, etc.
def date_and_time
  @time_right_now = Time.now.strftime('%d-%m-%Y at %H-%M-%S')
end

# Defines what we want to see place this method
# in action that happen when a test script fails
# (Screenshopt generation)
def failed_test
  date_and_time #                    ad_starter_global_methods
  File.open("./Test-Fail - #@time_right_now.jpeg", 'wb') do |f|
    sleep 1
    f.save_screenshot("./Test-Fail - #@time_right_now.jpeg", full: true)
  end
end

def log_generation
  date_and_time #                    ad_starter_global_methods
  @test_log = File.open("Test Log - #@time_right_now.txt", 'a')

  @test_log.puts("                   Test Log: #@time_right_now\n")
  @test_log.puts('.........................................' \
    ".........................\n\n")
end

def log_say(message)
  puts(message)
  @test_log.puts("\n#{message}")
end

# Pull in the action title that the Script refers to.
def test_task_title(callee)
  log_say("................\nTest/Task #{callee}")
end
