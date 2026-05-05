class Notification < ApplicationRecord
  belongs_to :user          # receiver
  belongs_to :sender, polymorphic: true
  belongs_to :item

  enum notification_type: {
    comment: "comment",
    verified: "verified",
    claim: "claim" 
  }
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      created_at
      updated_at
      is_read
      item_id
      notification_type
      sender_id
      sender_type
      user_id
    ]
  end
  def self.ransackable_associations(auth_object = nil)
    %w[user sender item]
  end
end