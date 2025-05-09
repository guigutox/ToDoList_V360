Rails.application.routes.draw do
  root 'sessions#new'

  resources :todo_lists do
    resources :todo_items do
      patch :toggle_done, on: :member
    end
  end


  get  "/signup", to: "users#new",    as: "signup"
  post "/signup", to: "users#create"


  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
end
