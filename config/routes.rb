Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  get 'welcome/index'

  devise_scope :user do
    get 'users/dashboard' => 'sessions#dashboard'
  end

  resources :wikis

  root 'welcome#index'
end
