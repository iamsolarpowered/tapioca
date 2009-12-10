module Tapioca
  module BaseController
  
    private
    
    def access_denied
      flash[:error] = "You don't have permission to perform the last requested action."
      redirect_to request.env['HTTP_REFERER'] || root_url
    end

    def current_user  
      @current_user ||= current_user_session && current_user_session.user
    end

    def current_user_session
      @current_user_session ||= UserSession.find
    end
    
    def load_current_user
      current_user
    end
    
    def menu_items
      []
    end
    
    def redirect_back_or_default(default_path=root_path)
      path = session[:return_to] || default_path
      session[:return_to] = nil # reset return_to
      redirect_to path
    end
  
  end
end
