Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:show, :index, :edit, :update, :destroy] do
    member do
      post :approved
    end
  end
end
