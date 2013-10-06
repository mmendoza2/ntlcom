SampleApp::Application.routes.draw do
  resources :search_suggestions

  resources :estados

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :eventos
  resources :locations
  resources :micrositios

  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root to: 'notelimites#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/nosotros',   to: 'notelimites#nosotros',   via: 'get'
  match '/contacto', to: 'notelimites#contacto', via: 'get'
  match '/micrositios', to: 'micrositios#index', via: 'get'






end
