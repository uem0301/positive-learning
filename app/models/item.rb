class Item < ApplicationRecord
  belongs_to :user
  belongs_to  :collection
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  validate :image_or_video_present?
  has_many :item_tags, dependent: :destroy 
  has_many :tags , through: :item_tags
  has_many :favorites

  validates :title, presence: true
  validates :explanation, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 画像もしくは動画がない場合エラーとする
  def image_or_video_present?
    if image.blank? && video.blank?
      errors.add(:error, "画像もしくは動画をアップロードしてください。")
    end
  end
end
