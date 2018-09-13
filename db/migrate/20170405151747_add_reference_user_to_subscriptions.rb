class AddReferenceUserToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :subscriptions, :user, index: true, foreign_key: true
    add_column :subscriptions, :price, :integer
    add_column :subscriptions, :paid, :boolean
    add_column :subscriptions, :order_destroy, :boolean
  end
end
