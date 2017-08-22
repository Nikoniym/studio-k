ActiveAdmin.register TrainingName do
  menu parent: 'Расписание'
  actions :all, :except => [:show]
  permit_params :name, :name_shot

  index do
    column :name
    column :name_shot
      

    actions
  end
end
