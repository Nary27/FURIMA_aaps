class Address < ApplicationRecord
  validates :postcode,                    presence: true, on: :validates_address
  validates :prefecture_id,                  presence: true, on: :validates_address
  validates :cities,                      presence: true, on: :validates_address
  validates :blocks,                      presence: true, on: :validates_address
  validates :builds,                      presence: false,on: :validates_address

  
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
