class Tweet < ApplicationRecord
  # Validations

  validates :body, null: false, presence: true, maxlength: 140
  
  # Associations

  belongs_to :user

  has_many :replies, class_name: "Tweet",
                      foreign_key: "replied_to_id"

  belongs_to :replied_to, class_name: "Tweet", optional: true
end
