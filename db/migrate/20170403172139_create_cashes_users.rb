class CreateCashesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :cashes_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :cash, index: true
    end
  end
end
