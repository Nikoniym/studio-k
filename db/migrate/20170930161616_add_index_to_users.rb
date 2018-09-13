class AddIndexToUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, [ :first_name, :last_name ], :unique => true
  end
end
