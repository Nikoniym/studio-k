ActiveAdmin.register TimeSpending do
  config.sort_order = 'time_start_asc'
  actions :all, :except => [:show]
  permit_params :name, :time_start

  index do
    column :name
    column :time_start do |t|
       t.time_start.strftime("%H:%M")
    end

    actions
  end

  form do |f|
    f.inputs do
      f.input :time_start
      f.input :name
    end
    f.actions
  end

end
