Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  # get 'drinks/search' => 'drinks#search' 
  
  resources :users, only: [:show] do
    member do
      get :mycalories
    end
  end
  
  resources :shops, only: [:index, :show]
  resources :drinks, only: [:index, :show, :search]
  resources :takes, only: [:create, :destroy]
end
