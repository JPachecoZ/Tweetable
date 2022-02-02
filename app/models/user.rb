class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
    validates :username, presence: true, uniqueness: true
    validates :name, presence:true

  # Associations
    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :avatar

    enum role: { member: 0, admin: 1 }
end
