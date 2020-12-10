Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
  end
  get '/tweet/tag/:name', to: "tweets#tag"
  resources :users, only: :show
end
