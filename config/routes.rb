Rails.application.routes.draw do
  root 'restaurants#home'
  resources :ingredients
  resources :categories
  resources :dishes
  resources :restaurants do
    collection do
      get 'home'
      post 'home'
      get 'restaurant'
      post 'restaurant'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
