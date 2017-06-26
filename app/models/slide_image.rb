class SlideImage < ApplicationRecord
  has_attached_file :image, styles: { medium: "1600>", small:"1000>", large:"1880>", thumb: "100x100>" }, default_url: "/images/:style/missing_thumb.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_one :content
end
