# frozen_string_literal: true

# This file is the CONTROLLER.
# It contains only Task we want to run.
#--------------------------------------------------------

# Pull in framework files
require_relative 'ad_starter_actions'
require_relative 'ad_starter_global_methods'
require_relative 'ad_starter_properties'

# Pull in Scripts with tasks (such as Excel export).
require_relative 'ad_starter_tasks'

# Can be moved to ad_starter_global_methods > #setup.
log_generation

# Call Scripts with tasks
visit_site_task
log_in_task
start_company_task
