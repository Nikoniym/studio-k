class AddTariffToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :tariff, :string
  end
end
