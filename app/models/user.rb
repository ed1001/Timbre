class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :avoids, dependent: :destroy

  validates :user_name, presence: true
  validates :email, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  # validates :sc_url, presence: true, format: { with: /\Ahttps:\/\/soundcloud.com\/[^\/]+\/(sets\/)?[^\/]+\z/i, message: "Incorrect format for Soundcloud track or playlist"}

  scope :all_except, ->(user, avoids) { where.not(id: user).where.not(id: avoids) }
end
