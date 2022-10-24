Rails.application.routes.draw do
  resources :users
  resources :beers
  resources :breweries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'ratings', to: 'ratings#index'
  # get 'ratings/new' ,  to: 'ratings#new'
  # post 'ratings' , to: 'ratings#create'

  resources :ratings, only: [:index, :new, :create, :destroy]

  root 'breweries#index'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'sign-out', to: 'sessions#destroy'

  resource :session, only: [:index, :new, :create, :destroy]

end