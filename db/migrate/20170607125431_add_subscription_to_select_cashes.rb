class AddSubscriptionToSelectCashes < ActiveRecord::Migration[5.1]
  def change
    add_column :select_cashes, :subscription, :boolean
  end
end
