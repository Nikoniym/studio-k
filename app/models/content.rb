class Content < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :slide_image
end
