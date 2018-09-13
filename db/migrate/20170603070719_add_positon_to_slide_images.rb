class AddPositonToSlideImages < ActiveRecord::Migration[5.1]
  def change
    add_column :slide_images, :position, :integer
  end
end
