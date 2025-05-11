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


  test "nao deve criar uma lista sem title" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    assert_no_difference('TodoList.count') do
      post todo_lists_path, params: { todo_list: { title: "", description: "Lista de itens para comprar." } }
    end
    assert_response :unprocessable_entity
  end

  test "nao deve criar uma lista sem description" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }

    assert_no_difference('TodoList.count') do
      post todo_lists_path, params: { todo_list: { title: "Lista de Compras", description: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "ao criar uma lista, deve redirecionar para a página da lista" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    post todo_lists_path, params: { todo_list: { title: "Lista de Compras", description: "Lista de itens para comprar." } }
    assert_redirected_to todo_list_path(TodoList.last)
  end

  test "deve carregar a página de edição da lista" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    todo_list = todo_lists(:lista1)
    get edit_todo_list_path(todo_list)
    assert_response :success
  end

  test "deve atualizar uma lista" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    todo_list = todo_lists(:lista1)
    patch todo_list_path(todo_list), params: { todo_list: { title: "Lista Atualizada", description: "Descrição atualizada." } }
    assert_redirected_to todo_list_path(todo_list)
    todo_list.reload
    assert_equal "Lista Atualizada", todo_list.title
    assert_equal "Descrição atualizada.", todo_list.description
  end

  test "deve excluir uma lista" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    todo_list = todo_lists(:lista1)
    assert_difference('TodoList.count', -1) do
      delete todo_list_path(todo_list)
    end
    assert_redirected_to todo_lists_path
  end

end
