class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  def self.ransackable_attributes(auth_object = nil)
    %w[id content user_id item_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user item]
  end
  validates :content, presence: true


end
