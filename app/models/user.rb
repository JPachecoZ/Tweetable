class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # Validations
    validates :username, presence: true, uniqueness: true
    validates :name, presence:true

  # Associations
    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_secure_token
    has_one_attached :avatar

    enum role: { member: 0, admin: 1 }

    def avatar_attachment_path
      avatar.attached? ? avatar: 'default.png'
    end

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.nickname
        user.username = auth.info.nickname
        user.email = auth.info.email
        user.password = ""
      end
    end
end
