class AddPositionAndPublishToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :position, :integer
    add_column :albums, :publish, :boolean
  end
end
