class AddShowTheacherToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :show_teacher, :boolean
  end
end
