class CreateTimetables < ActiveRecord::Migration[5.0]
  def change
    create_table :timetables do |t|
      t.belongs_to :day_week, index: true
      t.belongs_to :time_spending, index: true
      t.belongs_to :training_name, index: true
      t.belongs_to :teacher, index: true
      t.integer :place
      t.timestamps
    end
  end
end
