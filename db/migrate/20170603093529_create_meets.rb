class CreateMeets < ActiveRecord::Migration[5.0]
  def change
    create_table :meets do |t|
      t.date :date
      t.string :description
      t.string :time_start
      t.attachment :image

      t.timestamps
    end
  end
end
