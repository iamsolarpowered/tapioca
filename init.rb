ActionView::Base.send :include, TapiocaHelper

#ActiveRecord::Base.send :include, Tapioca::ActiveRecord

#ApplicationController.class_eval do
#  inherit_resources # See http://github.com/josevalim/inherited_resources/
#  
#  protect_from_forgery # See ActionController::RequestForgeryProtection for details

#  # Scrub sensitive parameters from your log
#  filter_parameter_logging :password, :password_confirmation
#  
#  helper :all
#  helper_method :current_user, :current_user_session
#  
#  private
#  
#  def current_user
#    @current_user ||= current_user_session && current_user_session.user
#  end
#  
#  def current_user_session
#    @current_user_session ||= UserSession.find
#  end
#    
#end
