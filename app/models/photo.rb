class Photo < ApplicationRecord
  belongs_to :user

  validates :photo, presence: true
  validates :position, presence: true, inclusion: 0..5, uniqueness: { scope: :user_id }

  mount_uploader :photo, PhotoUploader
end
