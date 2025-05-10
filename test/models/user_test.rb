require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users
  test "deve ser válido com username e senha" do
    user = users(:usuario1)
    assert user.valid?
  end
end
