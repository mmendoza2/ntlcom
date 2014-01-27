NoTeLimites::Application.routes.draw do

  resources :search_suggestionns

  root to: 'notelimites#home'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  match '/users/auth/facebook' => 'devise/omniauth_callbacks#passthru',  via: 'get'
  match 'auth/:provider/callback', to: 'sessions#create',   via: 'get'
  match 'auth/failure', to: redirect('/'),                  via: 'get'
  match '/users/sign_out',    to: 'devise/sessions#destroy',    via: 'post'
  match '/users/seleccionestados',    to: 'users#editestados',    via: 'get'
  match '/users/seleccionactividades',    to: 'users#editactividades',    via: 'get'
  match '/users/seleccionlugares',    to: 'users#editlugares',    via: 'get'
  match '/users/seleccionusuarios',    to: 'users#editusuarios',    via: 'get'
  match '/index',    to: 'notelimites#index',    via: 'get'
  match '/ayuda',    to: 'notelimites#ayuda',    via: 'get'
  match '/terminos',    to: 'notelimites#terminos',    via: 'get'
  match '/nosotros',   to: 'notelimites#nosotros',   via: 'get'
  match '/contacto', to: 'notelimites#contacto', via: 'get'
  match '/instrucciones', to: 'notelimites#instrucciones', via: 'get'
  match '/micrositios', to: 'micrositios#index', via: 'get'

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
  resources :actividades do
    member do
      get :following, :followers
    end
  end
  resources :estados do
    member do
      get :following, :followers
    end
  end
  resources :actividadespadre do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :actividades
  resources :actividades, :as => :actividad
  resources :actividadespadre
  resources :actividadespadre, :as => :actividadpadre
  resources :estados
  resources :categorias
  resources :eventos
  resources :locations
  resources :micrositios
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :relationeventos, only: [:create, :destroy]
  resources :relationmicrositios, only: [:create, :destroy]
  resources :relationestados, only: [:create, :destroy]
  resources :relationactividades, only: [:create, :destroy]
  resources :relationactividadespadre, only: [:create, :destroy]











end
