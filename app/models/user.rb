class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable, :timeoutable, :trackable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :collections,  dependent: :destroy
  has_many :items,  dependent: :destroy
  has_many :favorites,  dependent: :destroy
  has_many :favorite_items, through: :favorites, source: :item
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :comments,  dependent: :destroy

  # フォローをしているか確認
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  # フォローをする
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  # フォローを外す
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "松山 弘平"
    end
  end
end
