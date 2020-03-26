class User < ApplicationRecord
  has_many :cards

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # new入力項目
  validates :nickname,                presence: true, length: {maximum: 20}, on: :validates_new
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_new
  validates :password,                presence: true, length: {minimum: 6, maximum: 128}, on: :validates_new
  validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128}, on: :validates_new

  # # address入力項目
  validates :lastname_kanji,             presence: true, on: :validates_new
  validates :firstname_kanji,            presence: true, on: :validates_new
  validates :lastname_katakana,          presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/} ,on: :validates_new
  validates :firstname_katakana,         presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/} ,on: :validates_new
  validates :birth_year,                 presence: true, on: :validates_new
  validates :birth_month,                presence: true, on: :validates_new
  validates :birth_day,                  presence: true, on: :validates_new
  validates :tel,                        presence: true, on: :validates_new
  #tel入力項目



  has_many :buyers_users, dependent: :destroy
  has_many :user_credit_cards, dependent: :destroy
  has_many :sellers_users, dependent: :destroy
  has_many :items, dependent: :destroy
  has_one  :address
 


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
