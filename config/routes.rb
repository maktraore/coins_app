Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  root  'admins#index', as: 'home'  
  delete "/receivers/ten", to:'admins#destroy_ten'
  delete "/receivers/twenty", to:'admins#destroy_twenty'
  resources :receivers, except: [:show] 
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
