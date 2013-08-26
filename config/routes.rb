Infocom::Application.routes.draw do
  resources :users do
  	put :man, :on => :member
    put :adm, :on => :member
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :agents
  resources :posts
  resources :messages do
    put :answer, :on => :member
  end
  resources :emails

  resources :requests do
  	put :fin, :on => :member
  end

  get "index.html" => "static_pages#index"

  match "/mail_to", to: 'static_pages#mail_to'

  match "/contacts.html", to: 'static_pages#contacts'
  match "contacts/messages", to: 'static_pages#create'

  match "/services.html", to: 'static_pages#services'

  match "/services/it_autsorsing_nnov.html", to: 'static_pages#it_autsorsing'
  match "/services/it_audit_nnov.html", to: 'static_pages#it_audit'
  match "/services/korporativniy_sait_nnov.html", to: 'static_pages#sait'
  match "/services/proectirovanie_i_montazh_lvs.html", to: 'static_pages#local'
  match "/services/obsluzhivanie_orgtehniki.html", to: 'static_pages#printers'
  match "/services/ustanovka_servera.html", to: 'static_pages#servers'


  match "/about_us.html", to: 'static_pages#about_us'
  match "/help.html", to: 'static_pages#help'
  match "/articles.html", to: 'static_pages#articles'

  match '/signup.html',  to: 'users#new'
  match '/signin.html',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  root to: 'static_pages#index'

end
