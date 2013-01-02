Covoiturage::Application.routes.draw do
  
  resources :users, :only => [:new, :create, :update, :edit] do
    resources :ads, :only => [:index, :new, :create]
  end

  post "/search" => "ads#search"
  # get  "/profile" => "users#edit", :as => "user_profile"
  
  # /profile
  # /search
  # /ads
  # /ads/user_id/new
  # /signup
  # /signin
  
  root :to => "application#index"
end
