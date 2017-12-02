# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:default] = "posted on %b, %m %Y - %I:%M%p"
#my_date_formats = { :default => '%d/%m/%Y' } 