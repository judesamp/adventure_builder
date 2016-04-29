Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  resources :adventures, only: [ :index, :new ]

end
