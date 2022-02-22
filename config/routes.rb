Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pages, only: [:dashboard, :home]
  resources :heros do
    collection do
      get :top
    end
    resources :missions, only: %i[new create]
  end
  resources :missions, only: %i[edit update destroy accept reject show]
  resources :reviews, only: [:new]
end
