class Collection < ApplicationRecord
  belongs_to :user
  has_many   :items, dependent: :destroy 
  mount_uploader :image, ImageUploader
  # validates :name, presence: true, unless: :image?
  validate :image_present?
  validate :name_present?
  validate :explanation_present?

  # 名前、説明、画像選択がない場合エラーとする
  def image_present?
    if image.blank?
      errors.add(:error, "画像のアップロードを選択してください。")
    end
  end
  def name_present?
    if name.blank?
      errors.add(:error, "名前を入力してください。")
    end
  end
  def explanation_present?
    if explanation.blank?
      errors.add(:error, "説明を入力してください。")
    end
  end
end
