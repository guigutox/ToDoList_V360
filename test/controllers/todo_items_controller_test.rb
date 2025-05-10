require "test_helper"

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  test "deve criar um todo item" do
    user = users(:usuario1)
    todo_list = todo_lists(:lista1)

    post login_path, params: { username: user.username, password: "senha123" }
  
    assert_difference('TodoItem.count', 1) do
      post todo_list_todo_items_path(todo_list), params: { todo_item: { content: "Comprar leite", done: false, priority: 'alta' } }
    end

    assert_redirected_to todo_list_path(todo_list)
  end

  test "não deve criar um todo item sem conteúdo" do
    user = users(:usuario1)
    todo_list = todo_lists(:lista1)
  
    post login_path, params: { username: user.username, password: "senha123" }
  
    assert_no_difference('TodoItem.count') do
      post todo_list_todo_items_path(todo_list), params: { todo_item: { content: "", done: false, priority: "media" } }
    end
  
    assert_response :unprocessable_entity
  end
  
end
