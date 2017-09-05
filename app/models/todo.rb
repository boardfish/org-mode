class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: false
  validates :due, presence: false, in_future: true
end
