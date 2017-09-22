# This file utilizes Ruby-Selenium framework.

# Methods in this file are divided by easily distinguishing tasks.
# So program is easy to test.
# ------------------------------------------------------------------------------

def visit_site_task
  test_task_title(__callee__) # ad_starter_actions.rb
  setup # ad_starter_global_methods.rb
  # setup Selenium
  test_page_url # ad_starter_actions.rb
  validate_page_title # ad_starter_actions.rb
  # teardown Selenium
  teardown # ad_starter_global_methods.rb
end

def log_in_task
  test_task_title(__callee__) # ad_starter_actions.rb
  setup # ad_starter_global_methods.rb
  # setup Selenium
  test_page_url # ad_starter_actions.rb
  validate_page_title # ad_starter_actions.rb
  # teardown Selenium
  teardown # ad_starter_global_methods.rb
end
