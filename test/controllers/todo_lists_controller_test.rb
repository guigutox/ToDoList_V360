require "test_helper"

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  test "deve criar uma lista" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    
    assert_difference('TodoList.count', 1) do
      post todo_lists_path, params: { todo_list: { title: "Lista de Compras", description: "Lista de itens para comprar." } }
    end

    assert_redirected_to todo_list_path(TodoList.last)
  end
  
end
