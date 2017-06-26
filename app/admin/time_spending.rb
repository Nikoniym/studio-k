ActiveAdmin.register TimeSpending do
  actions :all, :except => [:show]
  permit_params :name, :position, :id, :time_start

  form do |f|

    f.inputs do
      f.input :time_start
      f.input :name
      f.input :position
      f.input :id
    end
    f.actions
  end

end
