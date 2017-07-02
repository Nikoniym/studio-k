class Meet < ApplicationRecord
  has_attached_file :image,
                    processors: [:thumbnail, :paperclip_optimizer],
                    :styles => { :medium => "500x500>", :thumb => "200x200>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
