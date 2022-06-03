Rails.application.routes.draw do
  resources :users
  resources :posts
  post 'posts/search', to: 'posts#search'
  resources :comments
end
