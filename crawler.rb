# This file is the CONTROLLER.
# It contains only the Gems and Task we want to run.
#--------------------------------------------------------

# Load Gems
require 'selenium-webdriver' # Testing framework / web parser.
require 'nokogiri' # Web parser. CSS/XPath selectors.
require 'rubysl-win32ole' # Forms xls file.

# Pull in framework files
require_relative 'ad_starter_actions'
require_relative 'ad_starter_global_methods'
require_relative 'ad_starter_properties'

# Pull in Scripts with tasks (such as Excel export).
require_relative 'output'

# Call Scripts with tasks
log_generation # If we wanted this to be on/off, it could be moved to
# ad_starter_global_methods > setup.
visit_site_task
