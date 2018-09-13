class DestroyTeacherAndRemovePositionFromTimeSpendings < ActiveRecord::Migration[5.1]
  def change
    drop_table :teachers
    remove_column :time_spendings, :position, :integer
    add_column :users, :head_message, :string
  end
end
