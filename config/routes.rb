Infocom::Application.routes.draw do
  get "static_pages/index"

  get "static_pages/contacts"

  get "static_pages/services"

  get "static_pages/about_us"

  get "static_pages/arcitles"

  root to: 'static_pages#index'

end
