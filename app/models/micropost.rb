class Micropost < ApplicationRecord
  belongs_to :user
  scope :by_created_at, -> { order(created_at: :desc) }
  MICROPOST_PARAMS = [:content, :image].freeze
  has_one_attached :image
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                message: "must be a valid image format" },
      size: { less_than: 5.megabytes, message: "should be less than 5MB" }

  def display_image
    image.variant resize_to_limit: [500, 500]
  end
end
