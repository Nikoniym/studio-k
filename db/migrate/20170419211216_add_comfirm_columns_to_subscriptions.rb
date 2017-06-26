class AddComfirmColumnsToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :confirm, :boolean
  end
end
