class AddSubscriptionLimitToCashes < ActiveRecord::Migration[5.1]
  def change
    add_column :cashes, :subscription_limit, :integer
  end
end
