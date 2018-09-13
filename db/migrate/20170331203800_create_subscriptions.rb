class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.boolean :active
      t.integer :count
      t.date :date_start
      t.date :date_finish
      t.belongs_to :cash, index: true
      t.belongs_to :select_cash, index: true

      t.timestamps
    end
  end
end
