class CreateCashSorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_sorts do |t|
      t.string :name

      t.timestamps
    end
    add_reference :users, :cash_sort, index: true, foreign_key: true
    add_reference :cashes, :cash_sort, index: true, foreign_key: true
    add_column :cashes, :last_name, :string
  end
end
