class AddTimeStartToTimespendingsAndTableBulishes < ActiveRecord::Migration[5.1]
  def change
    add_column :time_spendings, :time_start, :time
    add_column :table_publishes, :time_start, :time
    add_column :active_tables, :time_start, :time
  end
end
