Rails.application.routes.draw do

  #get 'welcome/index'

  #get "special", to: "welcome#index"
  #recursos anidados
  resources :articles do
    resources :comments, only: [:create, :destroy, :update, :show]
  end

  devise_for :users
  root "welcome#index"
end
