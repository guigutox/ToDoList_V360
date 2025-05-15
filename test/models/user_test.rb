require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "deve ser válido com username e senha" do
    user = users(:usuario1)
    user.password = "senha123"
    assert user.valid?, user.errors.full_messages.join(", ")
  end
end