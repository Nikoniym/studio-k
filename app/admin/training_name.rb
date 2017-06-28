ActiveAdmin.register TrainingName do
  actions :all, :except => [:show]
  permit_params :name, :name_shot

  index do
    column :name
    column :name_shot
    column :training_name
    column :user do |t|
      t.user.first_name if t.user.present?
    end
    column :place

    actions
  end
end
