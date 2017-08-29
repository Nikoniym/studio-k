class AddPositionAndPublishToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :position, :integer
    add_column :albums, :publish, :boolean
  end
end
