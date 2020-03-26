class Photo < ApplicationRecord
  belongs_to :item
  mount_uploader :url, ImageUploader

  validates :url,   presence: true

  scope :recentimg, -> {order('item_id DESC').limit(3)}
end
