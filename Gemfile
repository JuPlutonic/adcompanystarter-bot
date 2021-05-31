# frozen_string_literal: true

source 'https://rubygems.org'

# dsl to make driving browsers easy
gem 'capybara', '~> 3'

# cucumber-4.0.0.rc.1 (https://cucumber.io/)
gem 'cucumber'

# Headless Chrome driver for Capybara (https://github.com/machinio/cuprite)
gem 'cuprite'

# Nokogiri is an HTML, XML, SAX, and Reader parser
gem 'nokogiri', '=1.11.6'

# Ruby Standard Library - win32ole
gem 'rubysl-win32ole'

# for driving browsers
gem 'selenium-webdriver', '~> 3'

# gems in development group are not needed for running tests
# These gems are used when writing tests to help keep code high quality
group :development do
  # electing to use rdoc over yard for documentation here, because it
  # processes the dsl files by default while yard does not
  gem 'rdoc'

  # rubocop is LINT for ruby.  It analyzes your code for common ruby mistakes,
  # and also makes suggestions for style
  gem 'rubocop'
end
