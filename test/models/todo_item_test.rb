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

  test "deve ser inválido sem lista associada" do
    todo_item = TodoItem.new(content: "Teste")
    assert_not todo_item.valid?
    assert_includes todo_item.errors[:todo_list], "é obrigatório(a)"
  end
  
  test "deve ser inválido sem conteúdo" do
    todo_item = TodoItem.new(todo_list: todo_lists(:lista1))
    assert_not todo_item.valid?
    assert_includes todo_item.errors[:content], "não pode ficar em branco" 
    assert_includes todo_item.errors[:content], "é muito curto (mínimo: 3 caracteres)"
  end

  test "valor padrão de done deve ser false" do
    @todo_item.save!
    assert_not @todo_item.done
  end
end
