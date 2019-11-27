Rails.application.routes.draw do
  devise_for :users
  resources :rulesets
  get "/play/:id", to: "play#index", as: "play"
  root "rulesets#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
