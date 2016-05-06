Rails.application.routes.draw do

  get 'scenes/index'

  get 'scenes/show'

  get 'scenes/new'

  get 'scenes/create'

  get 'scenes/update'

  get 'scenes/edit'

  devise_for :users

  root 'welcome#index'

  resources :adventures, only: [ :index, :new, :show, :create ]
  resources :scenes, only: [ :new, :create ]

end
