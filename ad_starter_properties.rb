# The data for the elements below are hard coded for this example.
# Usually they'd be parameters in abstract Excel files or a database.
# -------------------------------------------------------------------

@test_url = 'https://target-sandbox.my.com/'
@expected_result = 'Target.my.com' # <-- Change this to BREAK the test
@web_driver_to_use = :chrome
# Example.
# How to run script with login and password:
#   TARG_LOGIN=john@mail.io TARG_PWD=12345678 ruby crawler.rb
@env_login = ENV['TARG_LOGIN'] .to_s || 'error' # Set it before run crawler.rb
@env_password = ENV['TARG_PWD'].to_s || 'error' # Set it before run crawler.rb
