class ChangeColumnNameToCashes < ActiveRecord::Migration[5.1]
  def change
    remove_column  :cashes, :name, :string
    add_column :cashes, :date_finish, :date
  end
end
