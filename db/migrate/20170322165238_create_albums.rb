class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.attachment :avatar
      t.string :name

      t.timestamps
    end
  end
end
