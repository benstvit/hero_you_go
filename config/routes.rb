Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  resources :heros do
    resources :reviews, only: [:new, :create]
    collection do
      get :top
    end
    resources :missions, only: %i[new create]
  end
  resources :missions, only: %i[edit update destroy accept reject show]
end
