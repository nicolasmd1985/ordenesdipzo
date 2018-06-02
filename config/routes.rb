Rails.application.routes.draw do
  #get 'welcome/index'

  #get "special", to: "welcome#index"
  resources :articles

  devise_for :users
  root "welcome#index"
end
