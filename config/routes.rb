Rails.application.routes.draw do
  resources :ingredients, only: :index
  resources :recipes, only: [:index, :show]
  devise_for :users
  root to: 'pages#home'
end
