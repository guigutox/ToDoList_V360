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
end