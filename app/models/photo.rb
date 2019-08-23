class Photo < ApplicationRecord
  belongs_to :user

  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
