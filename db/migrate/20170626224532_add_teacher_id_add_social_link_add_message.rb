class AddTeacherIdAddSocialLinkAddMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :active_tables, :teacher_id, :integer
    add_column :table_publishes, :teacher_id, :integer
    add_column :users, :social_link, :string
    add_column :users, :message, :string
  end
end
