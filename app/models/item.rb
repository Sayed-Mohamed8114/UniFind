class Item < ApplicationRecord
  belongs_to :user

  enum status: { lost: 0, found: 1 }

  validates :title, :description, :status, presence: true
end