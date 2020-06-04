Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # get 'users/index'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"
  # root "users#index"

  resource :users

  get "show" => "users#index"
end
