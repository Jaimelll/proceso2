Rails.application.routes.draw do
 

  
 

  

  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'admin/dashboard#index'
  
  namespace :admin do
    resources :products do
      resources :formulas
    end
  end
  ActiveAdmin.routes(self)
  # comentario postesgres 3
  # Defines the root path route ("/")
  # root "articles#index"
end
