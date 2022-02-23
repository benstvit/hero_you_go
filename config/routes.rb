Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

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
