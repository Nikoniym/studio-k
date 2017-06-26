class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.belongs_to :slide_image, index: true
      t.string :name
      t.string :name_shot
      t.string :description

      t.timestamps
    end
  end
end
