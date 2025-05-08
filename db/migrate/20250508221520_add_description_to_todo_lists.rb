class AddDescriptionToTodoLists < ActiveRecord::Migration[7.1]
  def change
    add_column :todo_lists, :description, :text
  end
end
