Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show, :index] do
    member do
      post :approved
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
