Rails.application.routes.draw do

  root to: 'identifications#index'

  resources :languages, only: [:index, :show, :new, :create]
  resources :identifications, only: [:index, :show, :new, :create]
  
end
