class Notification < ApplicationRecord
  belongs_to :user          # receiver
  belongs_to :sender, polymorphic: true
  belongs_to :item

  enum notification_type: {
    comment: "comment",
    verified: "verified",
    claim: "claim" 
  }
end