class AddAutoRegistrationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :auto_registration, :integer
  end
end
