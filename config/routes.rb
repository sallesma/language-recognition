Rails.application.routes.draw do
  root to: 'identifications#index'
  resources :identifications, only: [:index, :show, :new, :create]
  get 'identify' => 'application#identify'
end
