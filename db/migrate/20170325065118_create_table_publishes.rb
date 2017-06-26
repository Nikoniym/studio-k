class CreateTablePublishes < ActiveRecord::Migration[5.0]
  def change
    create_table :table_publishes do |t|
      t.string :day_week
      t.string :time_spending
      t.string :training_name
      t.string :name_shot
      t.string :teacher
      t.integer :place

      t.timestamps
    end
  end
end
