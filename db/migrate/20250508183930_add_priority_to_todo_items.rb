class AddPriorityToTodoItems < ActiveRecord::Migration[7.1]
  def change
    add_column :todo_items, :priority, :integer
  end
end
