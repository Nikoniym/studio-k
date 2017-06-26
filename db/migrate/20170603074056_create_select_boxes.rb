class CreateSelectBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :select_boxes do |t|
      t.string :name
      t.string :name_shot

      t.timestamps
    end
  end
end
