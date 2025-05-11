require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "deve carregar a página de login" do
    get login_path
    assert_response :success
  end

  test "deve realizar login com credenciais válidas" do
    user = users(:usuario1)
    post login_path, params: { username: user.username, password: "senha123" }
    assert_response :redirect 
    follow_redirect!
    assert_response :success 
  end
  
  test "deve realizar logout" do
    delete logout_path
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "não deve realizar login com credenciais inválidas" do
    post login_path, params: { username: "usuario_invalido", password: "senha_invalida" }
    assert_response :unprocessable_entity
  end

  test "não deve realizar login com senha vazia" do
    post login_path, params: { username: "usuario_invalido", password: "" }
    assert_response :unprocessable_entity
  end
  
  test "não deve realizar login com username vazio" do
    post login_path, params: { username: "", password: "senha_invalida" }
    assert_response :unprocessable_entity
  end
end