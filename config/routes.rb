Rails.application.routes.draw do

  root to: 'languages#index'

  resources :languages, only: [:index, :show, :new, :create] do
    patch :train, on: :member
  end
  resources :identifications, only: [:index, :show, :new, :create]
  
end
