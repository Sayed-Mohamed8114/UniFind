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
       
       
end
