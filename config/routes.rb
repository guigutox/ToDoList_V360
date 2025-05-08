Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :todo_lists do
    resources :todo_items, except: [:index, :show] do
      member do
        patch :toggle_done
      end
    end
  end

  root "todo_lists#index"
end
