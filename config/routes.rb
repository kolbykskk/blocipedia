Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

  get 'welcome/index'

  devise_scope :user do
    get 'users/dashboard' => 'sessions#dashboard'
    put 'users/downgrade' => 'sessions#downgrade'
  end

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges, only: [:new, :create]

  root 'welcome#index'
end
