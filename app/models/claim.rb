class Claim < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :content, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["user", "item"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "content", "user_id", "item_id", "created_at", "updated_at"]
  end
end
