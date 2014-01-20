class Evento < ActiveRecord::Base
  belongs_to :user
  belongs_to :estado
  belongs_to :micrositio
  has_many :followers, through: :reverse_relationeventos, source: :follower
  has_many :actimicros
  has_many :actividades, :through => :actimicros
  has_many :reverse_relationeventos, foreign_key: "followed_id",
           class_name:  "Relationevento",
           dependent:   :destroy


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
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]



  def micrositio_name
    micrositio.try(:name)
  end

  def micrositio_name=(name)
    self.name = Micrositio.find_by_name(name) if name.present?
  end


  extend FriendlyId
  friendly_id :nombre, use: :slugged

end
