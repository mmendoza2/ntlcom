class Evento < ActiveRecord::Base
  belongs_to :user

  has_many :relationeventos, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationeventos, source: :followed

  has_many :reverse_relationeventos, foreign_key: "followed_id",
           class_name:  "Relationevento",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationeventos, source: :follower

  validates :user_id, presence: true
  default_scope -> { order('created_at DESC') }
  validates :nombre, presence: true
  validates :descripcion, presence: true
  validates :artista, presence: true
  validates :precio, presence: true
  validates :fecha, presence: true
  validates :urloficial, presence: true
  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



  extend FriendlyId
  friendly_id :nombre, use: :slugged


  def followingevento?(other_user)
    relationeventos.find_by(followed_id: other_user.id)
  end

  def followevento!(other_user)
    relationeventos.create!(followed_id: other_user.id)
  end

  def unfollowevento!(other_user)
    relationeventos.find_by(followed_id: other_user.id).destroy!
  end



  def self.search(search)
    if search
      find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end








end
