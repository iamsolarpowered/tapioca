ActionController::Routing::Routes.draw do |map|
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
end
