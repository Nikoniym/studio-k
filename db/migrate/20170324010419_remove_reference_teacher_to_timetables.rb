class RemoveReferenceTeacherToTimetables < ActiveRecord::Migration[5.0]
  def change
    remove_reference :timetables, :teacher
    add_reference :timetables, :user, index: true
  end
end
