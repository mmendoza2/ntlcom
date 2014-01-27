class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :micrositios
  has_many :eventos
  has_many :microposts, dependent: :destroy
  has_many :authorizations

    has_many :relationactividadespadre, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_actividadespadre, through: :relationactividadespadre, source: :followed

  has_many :relationactividades, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_actividades, through: :relationactividades, source: :followed

      has_many :relationestados, foreign_key: "follower_id", dependent: :destroy
      has_many :followed_estados, through: :relationestados, source: :followed

  has_many :relationeventos, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_eventos, through: :relationeventos, source: :followed

      has_many :relationmicrositios, foreign_key: "follower_id", dependent: :destroy
      has_many :followed_micrositios, through: :relationmicrositios, source: :followed

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :photo, :styles => { :large => "200x200>", :normal => "100x100>", :square =>"50x50>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]

  before_create :create_remember_token



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
        user.email  = auth.info.email
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.avatar = auth.info.image
        user.save!
      end
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
  rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil # or consider a custom null object
  end

  def friends_count
    facebook { |fb| fb.get_connection("me", "friends").size }
  end

  def friends_using_app
  facebook { |fb| fb.get_connection("me", "friends?fields=installed") }
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

      def followingactividad?(other_user)
        relationactividades.find_by(followed_id: other_user.id)
      end
      def followactividad!(other_user)
        relationactividades.create!(followed_id: other_user.id)
      end
      def unfollowactividad!(other_user)
        relationactividades.find_by(followed_id: other_user.id).destroy!
      end

  def followingestado?(other_user)
    relationestados.find_by(followed_id: other_user.id)
  end
  def followestado!(other_user)
    relationestados.create!(followed_id: other_user.id)
  end
  def unfollowestado!(other_user)
    relationestados.find_by(followed_id: other_user.id).destroy!
  end

      def followingactividadpadre?(other_user)
        relationactividadespadre.find_by(followed_id: other_user.id)
      end
      def followactividadpadre!(other_user)
        relationactividadespadre.create!(followed_id: other_user.id)
      end
      def unfollowactividadpadre!(other_user)
        relationactividadespadre.find_by(followed_id: other_user.id).destroy!
      end



  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
