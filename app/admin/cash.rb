ActiveAdmin.register Cash do
  actions :all, :except => [:show]
  permit_params :last_name, :cash_count, :date_finish
  config.per_page = 100

  index do
    column :last_name
    column :cash_count
    column :cash_sort do |ad|
      ad.cash_sort.name
    end
    column :date_finish

    actions
  end

  form do |f|
    f.inputs do
      f.input  :last_name
      f.input  :cash_count
      f.input  :date_finish, :as => :datepicker
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons

  end
end