class Item < ApplicationRecord
  belongs_to :user
  belongs_to  :collection
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validates :title, presence: true, unless: :image?
  validates :video, presence: true, unless: :video?
end
