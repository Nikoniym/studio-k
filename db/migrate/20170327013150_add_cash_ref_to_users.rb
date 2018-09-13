class AddCashRefToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cash, :integer
  end
end
