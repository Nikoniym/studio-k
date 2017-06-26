class AddCashRefToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :cash, :integer
  end
end
