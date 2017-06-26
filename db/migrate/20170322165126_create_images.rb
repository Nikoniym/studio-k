class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :avatar
      t.belongs_to :album, index: true

      t.timestamps
    end
  end
end
