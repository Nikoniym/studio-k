class Album < ApplicationRecord
  has_attached_file :avatar,
                    processors: [:thumbnail, :paperclip_optimizer],
                    paperclip_optimizer: {
                        allow_lossy: false
                    },
                    :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :images

end
