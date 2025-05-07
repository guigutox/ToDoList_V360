Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end

  root "todo_lists#index"  # Definindo a página inicial como a página de listagem de listas de tarefas
end
