ActiveAdmin.register TrainingName do
  actions :all, :except => [:show]
  permit_params :name, :name_shot

  index do
    column :name
    column :name_shot
      

    actions
  end
end
