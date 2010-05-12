# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.

class ApplicationController < Refinery::ApplicationController
   layout proc{ |c| 
      if c.request.path_parameters[:controller] == 'inquiries' || c.request.path_parameters[:controller] == 'pages'  
        "page" 
      else 
        "application" 
      end
    }
end
