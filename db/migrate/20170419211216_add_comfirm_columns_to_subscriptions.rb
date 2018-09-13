class AddComfirmColumnsToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :confirm, :boolean
  end
end
