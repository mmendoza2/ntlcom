class User < ActiveRecord::Base

  has_many :relationeventos, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationeventos, source: :followed

  has_many :reverse_relationeventos, foreign_key: "followed_id",
           class_name:  "Relationevento",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationeventos, source: :follower


  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :micrositios
  has_many :eventos
  has_many :microposts, dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }


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

   private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
