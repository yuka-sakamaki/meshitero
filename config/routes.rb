Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
  end
  get '/tweet/tag/:name', to: "tweets#tag"
end
