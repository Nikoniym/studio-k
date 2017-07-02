class SlideImage < ApplicationRecord
  has_attached_file :image,
                    processors: [:thumbnail, :paperclip_optimizer],
                    styles: { medium: {geometry: "1600x1600>"},
                              small:{geometry: "1000x1000>"},
                              large:{geometry: "1880x1800>"},
                              thumb: {geometry: "100x100>"} },
                    default_url: "/images/:style/missing_thumb.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_one :content
end
