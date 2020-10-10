class Collection < ApplicationRecord
  belongs_to :user
  has_many   :items
  mount_uploader :image, ImageUploader
  validates :name, presence: true, unless: :image?
end
