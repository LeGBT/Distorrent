# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def pref
     raw_config = File.open("#{Rails.root}/config/prefs.yml")
     config = YAML.load(raw_config)
     #$prefs=config.symbolize_keys[:pref]
     config
   end
   

   


  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
