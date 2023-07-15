Rails.application.routes.draw do
  resources :books
  resources :library_zones
  root to: "library_zones#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
