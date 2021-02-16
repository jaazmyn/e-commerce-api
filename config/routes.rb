Rails.application.routes.draw do
  devise_for :users
  
  namespace :v1 do
    resource :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
  end
end
