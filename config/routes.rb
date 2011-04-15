Distorrent::Application.routes.draw do
  resources :advanceds do
    collection do
  put :save
  end
  
  
  end

  resources :filterlists do
    collection do
  put :inc
  put :dec
  end
  
  
  end

  resources :rsslists
  match '/:controller(/:action(/:id))'
  match 'advanceds/save/' => 'advanced#save'
  match '/distorrent' => 'home#index'
  match '/' => 'home#index'
end


#								Vieille routes :
#
#ActionController::Routing::Routes.draw do |map|
#  map.resources :advanceds,  :collection => { :save => :put}
#
#  map.resources :filterlists, :collection => { :inc => :put, :dec =>:put}
#
#  map.resources :rsslists
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
#  map.connect 'advanceds/save/',:controller =>"advanced",:action=>"save"
#  map.connect '/distorrent',:controller => "home",:action =>"index"
# # map.connect 'filterlists/inc/:id', {:controller => "filterlists", :action => "inc" }
# # map.connect 'filterlists/dec/:id', {:controller => "filterlists", :action => "dec" }
#  map.root :controller => "home"
#end
