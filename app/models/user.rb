class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :academic_id,
            presence: true,
            uniqueness: true,
            format: { with: /\A\d{9}\z/, message: "must be exactly 9 digits" }

  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy 
  scope :blocked_users, -> { where(blocked: true) }
  def active_for_authentication?
    super && !blocked?
  end

  def inactive_message
    blocked? ? "Your account has been blocked by admin." : super
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      name
      academic_id
      blocked
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[items comments]
  end
       
       
end
