Covoiturage::Application.routes.draw do
  
  devise_for :users, :singular => :user

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
  end

  resources :users, :except => [:new, :create, :update, :edit, :index] do
    resources :ads, :only => [:index, :new, :create]
  end

  

  post "/search" => "ads#search"
  get  "/profile" => "users#profile", :as => "user_profile"
  
  # /profile
  # /search
  # /ads
  # /ads/user_id/new
  # /signup
  # /signin
  
  root :to => "application#index"
end
