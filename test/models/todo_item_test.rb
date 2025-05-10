require "test_helper"

class TodoItemTest < ActiveSupport::TestCase
  def setup
    @user = users(:usuario1)              
    @todo_list = todo_lists(:lista1)
    @todo_item = TodoItem.new(content: "Comprar pão", todo_list: @todo_list)
  end

  test "deve ser válido com conteúdo e lista" do
    assert @todo_item.valid?
  end

  test "deve ser inválido sem conteúdo" do
    @todo_item.content = nil
    assert_not @todo_item.valid?
    assert_includes @todo_item.errors[:content], "can't be blank"
  end

  test "deve ser inválido sem lista associada" do
    @todo_item.todo_list = nil
    assert_not @todo_item.valid?
    assert_includes @todo_item.errors[:todo_list], "must exist"
  end

  test "valor padrão de done deve ser false" do
    @todo_item.save!
    assert_not @todo_item.done
  end
end
