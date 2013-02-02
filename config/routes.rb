Covoiturage::Application.routes.draw do  
  devise_for :users, :singular => :user

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
    get '/register' => 'devise/registrations#new'
  end

  resources :users, :except => [:index, :new, :create, :show, :edit, :delete] do
    resources :ads, :only => [:new, :create, :show, :destroy] do
      resources :reservations, :only => [:create]
    end
  end  

  post "/search" => "ads#search"
  get  "/profile" => "users#profile", :as => "user_profile"
    
  root :to => "application#index"
end
