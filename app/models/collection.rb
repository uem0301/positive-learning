class Collection < ApplicationRecord
  belongs_to :user
  has_many   :items
  accepts_nested_attributes_for :items, allow_destroy: true
  mount_uploader :image, ImageUploader
  validates :name, presence: true, unless: :image?
end
