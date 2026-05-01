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
  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      email
      name
      academic_id
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[items comments]
  end
       
       
end
