class AddLongTimeToSelectCashes < ActiveRecord::Migration[5.0]
  def change
    add_column :select_cashes, :long_time, :boolean
  end
end
