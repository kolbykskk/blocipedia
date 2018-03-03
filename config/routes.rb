Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'welcome/index'

  resources :wikis

  root 'welcome#index'
end
