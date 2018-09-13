class CreateTrainingNames < ActiveRecord::Migration[5.1]
  def change
    create_table :training_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
