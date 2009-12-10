class UserSessionsController < ApplicationController
  layout 'application'
  
  skip_before_filter :load_and_authorize_resource
  
  def new
    @user_session = UserSession.new
  end

  def create
    if UserSession.create(params[:user_session])
      redirect_back_or_default
    else
      flash[:error] = 'Incorrect username and/or password. Please try again.'
      redirect_to login_url
    end
  end
  
  def destroy
    if current_user_session && current_user_session.destroy
      flash[:notice] = "You've been logged out."
    else
      flash[:error] = "There was a problem ending your session."
    end
    redirect_to root_url
  end
end
