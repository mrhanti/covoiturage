Covoiturage::Application.routes.draw do
  resources :users, :only => [:new, :create] do
    resources :ads, :only => [:index, :new, :create]
  end

  match "/search" => "ads#search"
  
  # /profile
  # /search
  # /ads
  # /ads/user_id/new
  # /signup
  # /signin
  
  root :to => "application#index"
end
