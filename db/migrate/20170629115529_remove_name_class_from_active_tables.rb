class RemoveNameClassFromActiveTables < ActiveRecord::Migration[5.1]
  def change
    remove_column :active_tables, :name_class, :string
  end
end
