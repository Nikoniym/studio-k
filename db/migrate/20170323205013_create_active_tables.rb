class CreateActiveTables < ActiveRecord::Migration[5.1]
  def change
    create_table :active_tables do |t|
      t.date :date
      t.string :day_week
      t.string :time_spending
      t.string :training_name
      t.string :teacher
      t.integer :place
      t.integer :place_current
      t.boolean :active
      t.string :head_class
      t.string :name_class

      t.timestamps
    end
  end
end
