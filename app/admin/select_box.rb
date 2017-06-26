ActiveAdmin.register SelectBox do
  actions :all, :except => [:show]
  permit_params :name, :name_shot

end
