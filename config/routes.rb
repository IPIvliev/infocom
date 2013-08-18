Infocom::Application.routes.draw do
  resources :users do
  	put :man, :on => :member
    put :adm, :on => :member
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :agents

  resources :requests do
  	put :fin, :on => :member
  end

  get "index.html" => "static_pages#index"

  match "/contacts", to: 'static_pages#contacts'

  match "/services", to: 'static_pages#services'

  match "/about_us", to: 'static_pages#about_us'

  match "/articles", to: 'static_pages#articles'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root to: 'static_pages#index'

end
