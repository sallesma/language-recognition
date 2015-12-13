Rails.application.routes.draw do
  get 'identify' => 'application#identify'
  get 'training' => 'application#training'
end
