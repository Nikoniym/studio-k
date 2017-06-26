class Image < ApplicationRecord
  resourcify

  has_attached_file :avatar, :styles => { :medium => "270x270#", :thumb => "100x100>" }, :default_url => "/images/:style/missing_thumb34.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  belongs_to :album


end
