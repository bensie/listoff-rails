ActionController::Routing::Routes.draw do |map|
  map.resources :todos, :has_many => :items
  map.root :controller => 'todos'
  map.resources :sessions, :users
    
  map.with_options(:controller => 'sessions') do |sessions|
    sessions.login  'login',  :action => 'new'
    sessions.logout 'logout', :action => 'destroy'
  end
  
  map.signup 'signup', :controller => 'users', :action => 'new'
end
