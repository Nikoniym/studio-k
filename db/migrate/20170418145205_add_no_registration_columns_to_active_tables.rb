class AddNoRegistrationColumnsToActiveTables < ActiveRecord::Migration[5.1]
  def change
    add_column :active_tables, :no_registration, :integer
  end
end
