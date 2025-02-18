class Tweet < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)} # retrieves tweets by most recent first
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 280 }
end
