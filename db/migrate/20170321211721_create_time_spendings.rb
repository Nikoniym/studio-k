class CreateTimeSpendings < ActiveRecord::Migration[5.1]
  def change
    create_table :time_spendings do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
