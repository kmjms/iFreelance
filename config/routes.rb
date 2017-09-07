Rails.application.routes.draw do
  resources :entities
  resources :clients
  resources :type_jobs
  resources :kind_entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
