# This file utilizes Ruby-Selenium framework

# Methods in this file are divided by easily distinguishing tasks
# So program is easy to test
# --------------------------------------------------------------------------------------------

def visit_site_task
  test_case_title           # ad_starter_actions.rb
  setup                     # ad_starter_global_methods.rb

    get_page_url            # ad_starter_actions.rb
    validate_page_title     # ad_starter_actions.rb

  teardown                  # ad_starter_global_methods.rb
end
