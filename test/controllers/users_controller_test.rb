require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "deve carregar a página de cadastro" do
    get signup_path
    assert_response :success
  end

  test "deve criar um novo usuário com dados válidos" do
    post signup_path, params: { user: { username: "usuario_de_teste", password: "password123", password_confirmation: "password123" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "não deve criar um novo usuário com username vazio" do
    post signup_path, params: { user: { username: "", password: "password123", password_confirmation: "password123" } }
    assert_response :unprocessable_entity
  end

  test "não deve criar um novo usuário com senha vazia" do
    post signup_path, params: { user: { username: "usuario_de_teste", password: "", password_confirmation: "" } }
    assert_response :unprocessable_entity
  end

  test "não deve criar um novo usuário com senhas diferentes" do
    post signup_path, params: { user: { username: "usuario_de_teste", password: "password123", password_confirmation: "senha_diferente" } }
    assert_response :unprocessable_entity
  end

  test "não deve criar um novo usuário com username já existente" do
    existing_user = users(:usuario1)
    post signup_path, params: { user: { username: existing_user.username, password: "password123", password_confirmation: "password123" } }
    assert_response :unprocessable_entity
  end
end