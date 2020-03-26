class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image_url, ImageUploader

  validates :image_url,   presence: true

  scope :image, -> (number){where(item_id: number)}
end