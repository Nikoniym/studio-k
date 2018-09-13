class CreateDayWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :day_weeks do |t|
      t.string :name

      t.timestamps
    end
  end
end
