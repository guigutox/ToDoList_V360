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
end