Rails.application.routes.draw do
  resources :vehicles, only: %i[index create]
  delete 'vehicles', to: 'vehicles#destroy'

  root 'vehicles#index'
end
