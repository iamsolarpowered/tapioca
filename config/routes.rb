ActionController::Routing::Routes.draw do |map|
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :users
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  map.signup 'signup', :controller => :users, :action => :new
end
