class TodoList < ApplicationRecord
    has_many :todo_items, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3, maximum: 40 }
    validates :description, presence: true, length: { minimum: 5, maximum: 80}
end
