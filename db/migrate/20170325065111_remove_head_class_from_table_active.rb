class RemoveHeadClassFromTableActive < ActiveRecord::Migration[5.1]
  def change
    remove_column :active_tables, :head_class, :string
  end
end
