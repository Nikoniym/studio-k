class AddNameShotToTrainingNames < ActiveRecord::Migration[5.0]
  def change
    add_column :training_names, :name_shot, :string
  end
end
