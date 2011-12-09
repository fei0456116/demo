class User < ActiveRecord::Base
  acts_as_list
  mount_uploader :face, FaceUploader
  
  attr_accessible :name, :email, :face
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :face, :on => :create
  
  def url_thumb
    face.thumb.url
  end
  
  def as_json(options = nil)
    options = {
      :methods => [:name, :url_thumb, :email]
    }.merge(options || {:only => "id"})
    super options
  end
  
end
