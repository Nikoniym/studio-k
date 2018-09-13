class CreateActiveTablesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :active_tables_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :active_table, index: true
    end
  end
end
