Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root  'admins#index', as: 'home'  
  # get "/receivers/:id/edit", to: 'receivers#edit_receiver'
  # patch "/receivers/:id/edit", to: 'receivers#update_receiver'
  # delete "/user/:id", to:'receivers#delete_admin'
  # get "/users/:id/edit", to:'receivers#edit'
  # patch "/users/:id/edit", to:'receivers#update_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :receivers, except: [:show] 
  resources :admins
end
