class Item < ApplicationRecord
  belongs_to :user
  before_update :handle_verification, if: :saved_change_to_is_verified?

  def self.ransackable_associations(auth_object = nil)
    ["user", "comments"]
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      title
      description
      status
      user_id
      image_path
      is_resolved
      is_verified
      created_at
      updated_at
    ]
  end

  enum status: { lost: 0, found: 1 }

  validates :title, :description, :status, presence: true
  has_many :comments, dependent: :destroy
  has_many :claims, dependent: :destroy

  private

  def handle_verification
    return unless is_verified?

    Notification.create!(
      user: user,
      sender: AdminUser.current, # optional helper if you add it
      item: self,
      notification_type: :verified,
      is_read: false
    )
  end
end