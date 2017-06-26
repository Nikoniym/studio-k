class CreateCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :cashes do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end
end
