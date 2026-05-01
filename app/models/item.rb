class Item < ApplicationRecord
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      title
      description
      status
      user_id
      image_path
      is_resolved
      created_at
      updated_at
    ]
  end

  enum status: { lost: 0, found: 1 }

  validates :title, :description, :status, presence: true
  has_many :comments, dependent: :destroy
end