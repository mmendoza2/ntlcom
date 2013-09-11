class Micrositio < ActiveRecord::Base
  validates :name, presence: true
  validates :descripcion, presence: true
  has_attached_file :photo, :styles => { :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => "/assets/images/micrositios/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/micrositios/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



end
