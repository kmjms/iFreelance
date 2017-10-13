Rails.application.routes.draw do

  root 'static_pages#home'
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :job_logs
  resources :jobs
  resources :quotations
  resources :entities
  resources :clients
  resources :type_jobs
  resources :kind_entities
  resources :facturas
  resources :project

  get 'send' => 'send#index'
  post 'send' => 'send#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'static_pages#home'
  root 'static_pages#home'
end
