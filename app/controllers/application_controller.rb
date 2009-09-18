class ApplicationController < ActionController::Base
  inherit_resources
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  respond_to :html, :xml, :json
  
  helper_method :current_user
  
private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # def begin_of_association_chain
  #   user
  # end
end
