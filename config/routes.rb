Rails.application.routes.draw do
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
  end
end
