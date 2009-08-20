class ApplicationController < ActionController::Base
  inherit_resources
  include SimplestAuth::Controller
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  respond_to :html, :xml, :json
  
  # before_filter :login_required
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # def begin_of_association_chain
  #   user
  # end
end
