Rails.application.routes.draw do
  root "static_pages#home"
  get    "/about",     to: "static_pages#about"
  get    "/contact",   to: "static_pages#contact"
  get    "/signup",    to: "users#new"
  get    "/login",     to: "sessions#new"
  post   "/login",     to: "sessions#create"
  delete "/logout",    to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :beansposts,    only: [:index, :new, :create, :destroy]
  resources :relationships,  only: [:create, :destroy]
end
