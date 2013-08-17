Infocom::Application.routes.draw do


  get "index.html" => "static_pages#index"

  match "/contacts", to: 'static_pages#contacts'

  match "/services", to: 'static_pages#services'

  match "/about_us", to: 'static_pages#about_us'

  match "/articles", to: 'static_pages#articles'

  root to: 'static_pages#index'

end
