ActiveAdmin.register SlideImage do
  actions :all, :except => [:show]
  permit_params :name, :image, :position

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
