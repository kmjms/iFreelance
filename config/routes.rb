Rails.application.routes.draw do
  #get 'static_pages/home'
  #root 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :state_projects
  resources :type_projects
  resources :incomes
  resources :freelances
  resources :expenses
  resources :projects
  resources :detail_invoices
  resources :invoices
  resources :clients
  root 'static_pages#home'
  get 'index' => 'static_pages#index'
  get 'send' => 'send#index'
  post 'send' => 'send#create'
  #get 'clients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
