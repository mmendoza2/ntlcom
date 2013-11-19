SampleApp::Application.routes.draw do

  root to: 'notelimites#home'

  match '/ayuda',    to: 'notelimites#ayuda',    via: 'get'
  match '/terminos',    to: 'notelimites#terminos',    via: 'get'
  match '/nosotros',   to: 'notelimites#nosotros',   via: 'get'
  match '/contacto', to: 'notelimites#contacto', via: 'get'
  match '/micrositios', to: 'micrositios#index', via: 'get'


  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  match '/users/auth/facebook' => 'devise/omniauth_callbacks#passthru',  via: 'get'
  match 'auth/:provider/callback', to: 'sessions#create',   via: 'get'
  match 'auth/failure', to: redirect('/'),                  via: 'get'




  match '/micrositios/fotos', to: 'micrositios#fotos', via: 'get'

  resources :search_suggestions

  resources :estados

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :eventos do
    member do
      get :following, :followers
    end
  end
  resources :micrositios do
    member do
      get :following, :followers
    end
  end


  resources :eventos
  resources :locations
  resources :micrositios

  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :relationeventos, only: [:create, :destroy]
  resources :relationmicrositios, only: [:create, :destroy]











end
