class Tweet < ApplicationRecord
  # Validations

  # validates :body, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  # , null: false,  maxlength: 140

  # Associations

  belongs_to :user, counter_cache: true

  has_many :likes, dependent: :destroy
  has_many :replies, class_name: "Tweet",
                    foreign_key: "replied_to_id",
                    dependent: :destroy, inverse_of: "replied_to"

  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count
end
