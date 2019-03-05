# frozen_string_literal: true

# This file utilizes Ruby-Selenium framework.
# Methods in this file are divided by easily distinguishing tasks.
# So program is easy to test.
# ------------------------------------------------------------------------------

def visit_site_task
  test_task_title(__callee__) #               ad_starter_actions.rb
  setup #                                     ad_starter_global_methods.rb
  # setup Selenium
  test_page_url #                             ad_starter_actions.rb
  validate_page_title #                       ad_starter_actions.rb
  # teardown Selenium
  teardown #                                  ad_starter_global_methods.rb
end

def log_in_task
  test_task_title(__callee__) #               ad_starter_actions.rb
  setup #                                     ad_starter_global_methods.rb
  # setup Selenium
  press_log_in_button #                       ad_starter_actions.rb
  check_sign_in_form #                        ad_starter_actions.rb
  submit_sign_in_form #                       ad_starter_actions.rb
  next_task unless balans_empty? #            ad_starter_actions.rb
  # teardown Selenium
  teardown #                                  ad_starter_global_methods.rb
end

def start_company_task
  test_task_title(__callee__) #              ad_starter_actions.rb
  # teardown Selenium
  start_company if page_of_ad_company? #     ad_starter_actions.rb
  teardown #                                 ad_starter_global_methods.rb
end
