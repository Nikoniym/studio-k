class RenameCountToCashes < ActiveRecord::Migration[5.0]
  def change
    remove_column  :cashes, :count, :integer
    add_column :cashes, :cash_count, :integer
  end
end
