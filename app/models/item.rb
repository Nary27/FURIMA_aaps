class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :category

  validates :name,              presence: true, length: { maximum: 40 }
  validates :text,              presence: true, length: { maximum: 1000 }
  validates :cost,              presence: true
  validates :situation,         presence: true
  validates :deliver_area,      presence: true
  validates :shipping_term,     presence: true
  validates :price,             presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id,       presence: true
  validates :user_id,           presence: true

  # バリデーション要検討
  # validates_associated :photos
  # validates :photos,            presence: true

  scope :category, -> (number){where(category_id: number)}
  scope :recent, -> {order('id DESC').limit(3)}
end
