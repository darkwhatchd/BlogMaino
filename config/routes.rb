Rails.application.routes.draw do
  #get 'commentaries/create'
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    resources :commentaries, only: %i[create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
