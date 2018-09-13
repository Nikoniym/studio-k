class CreateContentsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :contents_users, id: false  do |t|
      t.belongs_to :user, index: true
      t.belongs_to :content, index: true
    end
  end
end
