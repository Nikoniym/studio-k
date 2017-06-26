class CreateSelectCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :select_cashes do |t|
      t.integer :count
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
