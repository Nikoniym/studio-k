class RenameSlideimagesTableToSlideImagesTable < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :slideimages, :slide_images
  end

  def self.down
    rename_table :slide_images, :slideimages
  end
end
