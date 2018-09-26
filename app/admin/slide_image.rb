ActiveAdmin.register SlideImage do
  config.clear_sidebar_sections!
  menu parent: 'Оформление, наполнение'
  actions :all, :except => [:show]
  config.sort_order = [:position]
  permit_params :name, :image, :position

  controller do
    def scoped_collection
      end_of_association_chain.order(:position)
    end
  end

  index do
    column :name
    column :position
    column  :image do |ad|
      image_tag ad.image.url(:thumb)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input  :name
      f.input  :position
      f.input  :image
    end

    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  show do
    attributes_table do
      row :name
      row :image do |ad|
        image_tag ad.image.url(:thumb)
      end
    end
    active_admin_comments
  end

  action_item :view_site do
    link_to "gallery", "/"
  end

end
