class CreateSlideimages < ActiveRecord::Migration[5.1]
  def change
    create_table :slideimages do |t|
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
