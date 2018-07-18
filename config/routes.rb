Rails.application.routes.draw do
  get 'receiver/new'

  get 'receiver/create'

  get 'receiver/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :givers
end
