class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :content, presence: true, length: { minimum: 3, maximum: 30 }
  enum priority: { baixa: 0, media: 1, alta: 2 }, _default: :media
end
