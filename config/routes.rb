Rails.application.routes.draw do
  root "home#index"

  resources :todo_lists do
    resources :todo_items do
      patch :toggle_done, on: :member
    end
  end


  resources :users, only: [:show, :destroy]

  get  "/signup", to: "users#new",    as: "signup"
  post "/signup", to: "users#create"
  patch "/users/update_password", to: "users#update_password", as: "update_password"



  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
end
