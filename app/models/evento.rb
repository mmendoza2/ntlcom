class Evento < ActiveRecord::Base
  validates :nombre, presence: true
  validates :descripcion, presence: true
  validates :artista, presence: true
  validates :precio, presence: true
  validates :fecha, presence: true
  validates :urloficial, presence: true
  validates :estado, presence: true
  has_attached_file :photo, :styles => {:biggest => "900x900>", :big => "600x600>", :medium => "400x400>", :small => "200x200>", :smallest =>"100x100>" },
                    :url  => ":s3_domain_url",
                    :path => "/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 20.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  extend FriendlyId
  friendly_id :nombre, use: :slugged


  def self.search(search)
    if search
      find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end



  # Returns the +String+ full path including params of the last URL requested.
  #
  #    # get "/articles"
  #    request.fullpath # => "/articles"
  #
  #    # get "/articles?page=2"
  #    request.fullpath # => "/articles?page=2"
  def fullpath
    @fullpath ||= super
  end

  # Returns the original request URL as a +String+.
  #
  #    # get "/articles?page=2"
  #    request.original_url # => "http://www.example.com/articles?page=2"
  def original_url
    base_url + original_fullpath
  end






end
