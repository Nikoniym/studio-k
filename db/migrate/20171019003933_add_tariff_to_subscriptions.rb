class AddTariffToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :tariff, :string
  end
end
