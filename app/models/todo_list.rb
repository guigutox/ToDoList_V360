class TodoList < ApplicationRecord
    has_many :todo_items, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3, maximum: 40 }
end
