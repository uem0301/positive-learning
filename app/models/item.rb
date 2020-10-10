class Item < ApplicationRecord
  belongs_to :user
  belongs_to  :collection
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validates :title,:video, presence: true, unless: :image?, unless: :video?
end
