class Micropost < ApplicationRecord
  MICROPOST_PARAMS = [:content, :image].freeze
  belongs_to :user
  has_one_attached :image
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:  Settings.max_content}
  validates :image, content_type: { in: Settings.accept_image,
                                message: I18n.t("micropost.format_image") },
                                size: { less_than: Settings.size_max.megabytes, message: I18n.t("micropost.size_max_image")}
  default_scope ->{order(created_at: :desc)}
  scope :feed_by_following, -> (following_ids) {where user_id: following_ids}

  def display_image
    image.variant resize_to_limit: Settings.resize_to_limit
  end
end
