Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index', as: 'home'
  
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
end
