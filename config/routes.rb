Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  get '/tweet/tag/:name', to: "tweets#tag"
  resources :users, only: :show
end
