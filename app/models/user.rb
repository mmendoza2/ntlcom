class User < ActiveRecord::Base

  has_many :relationeventos, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationeventos, source: :followed

  has_many :relationmicrositios, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationmicrositios, source: :followed

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :micrositios
  has_many :eventos
  has_many :microposts, dependent: :destroy

  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }


  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end


  extend FriendlyId
  friendly_id :name, use: :slugged

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    Micropost.from_users_followed_by(self)
  end



  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  def followingevento?(other_user)
    relationeventos.find_by(followed_id: other_user.id)
  end

  def followevento!(other_user)
    relationeventos.create!(followed_id: other_user.id)
  end

  def unfollowevento!(other_user)
    relationeventos.find_by(followed_id: other_user.id).destroy!
  end

  def followingmicrositio?(other_user)
    relationmicrositios.find_by(followed_id: other_user.id)
  end

  def followmicrositio!(other_user)
    relationmicrositios.create!(followed_id: other_user.id)
  end

  def unfollowmicrositio!(other_user)
    relationmicrositios.find_by(followed_id: other_user.id).destroy!
  end


  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.avatar = auth.info.image
        user.save!
      end
    end
  end


  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
