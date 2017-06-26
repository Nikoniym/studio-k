ActiveAdmin.register TrainingName do
  actions :all, :except => [:show]
  permit_params :name, :name_shot

end
