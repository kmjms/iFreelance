Rails.application.routes.draw do
  devise_for :users
  resources :job_logs
  resources :jobs
  resources :quotations
  resources :entities
  resources :clients
  resources :type_jobs
  resources :kind_entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
