class Actividadpadre < ActiveRecord::Base

  belongs_to :categoria
  has_many :actividades

  has_many :reverse_relationactividadespadre, foreign_key: "followed_id",
           class_name:  "Relationactividadpadre",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationactividadespadre, source: :follower



  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"

  extend FriendlyId
  friendly_id :actividadpadre, use: :slugged

end
