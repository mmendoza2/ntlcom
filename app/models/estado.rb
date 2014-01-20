class Estado < ActiveRecord::Base
  has_many :eventos
  has_many :micrositios


  has_many :reverse_relationestados, foreign_key: "followed_id",
           class_name:  "Relationestado",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationestados, source: :follower


  validates :estado, presence: true
  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"


  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg' ]

  extend FriendlyId
  friendly_id :estado, use: :slugged
end
