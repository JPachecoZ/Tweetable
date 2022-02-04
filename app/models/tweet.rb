class Tweet < ApplicationRecord
  # Validations

  validates :body, presence: true

  # Associations

  belongs_to :user

  has_many :replies, class_name: "Tweet",
                      foreign_key: "replied_to_id"
  has_many :likes, dependent: :destroy

  belongs_to :replied_to, class_name: "Tweet", optional: true
end
