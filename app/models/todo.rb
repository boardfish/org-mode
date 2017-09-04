class Todo < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: false,
                    length: { minimum: 5 }
  validates :due, presence: true
  validates_inclusion_of :done, :in => [true, false]
end
