class Item < ApplicationRecord
  belongs_to :user
  belongs_to  :collection
  mount_uploader :image, ImageUploader
  validates :title, presence: true, unless: :image?, unless: :video?
end
