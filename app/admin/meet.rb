ActiveAdmin.register Meet do
  config.clear_sidebar_sections!
  menu parent: 'Оформление, наполнение'
  actions :all, :except => [:show]
  permit_params :image, :description,  :time_start, :date

  index do
    column  :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    column :date
    column :description
    column :time_start

    actions
  end
  form do |f|
    f.inputs do
      f.input  :date, :as => :datepicker
      f.input  :description
      f.input  :time_start
      f.input  :image
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
