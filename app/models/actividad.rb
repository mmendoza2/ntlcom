class Actividad < ActiveRecord::Base

  belongs_to :categoria
  has_many :actimicros
  has_many :micrositios, :through => :actimicros

  belongs_to :actividadpadre

  has_many :reverse_relationactividades, foreign_key: "followed_id",
           class_name:  "Relationactividad",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationactividades, source: :follower



  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]

  extend FriendlyId
  friendly_id :actividad, use: :slugged

end
