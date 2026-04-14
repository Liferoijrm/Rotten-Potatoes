Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  #==================================================
  # CRUD básico (dava pra fazer com "resources :movies")
  # essa sintaxe do "to:" faz basicamente o mesmo que "=>"

  root "movies#index" # define index.html como raiz do projeto

  get "/movies", to: "movies#index", as: "movies"

  get "/movies/new", to: "movies#new", as: "new_movie"
  post "/movies", to: "movies#create"

  get "/movies/:id", to: "movies#show", as: "movie"

  get "/movies/:id/edit", to: "movies#edit", as: "edit_movie"
  patch "/movies/:id", to: "movies#update"
  put "/movies/:id", to: "movies#update"

  delete "/movies/:id", to: "movies#destroy"
  #==================================================

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
