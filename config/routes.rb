Rails.application.routes.draw do
  get 'heroes/index'
  get 'heroes/show'
  get 'heroes/new'
  get 'heroes/edit'
  get 'reviews/new'
  get 'missions/new'
  get 'missions/edit'
  get 'missions/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
