ActiveAdmin.register User do
  menu priority: 1
  actions :all, :except => [:show]
  permit_params :first_name, :avatar, :last_name, :social_link, :show_teacher, :trial_lesson, :phone, :email, :specialty, :message, :head_message, :role_ids => []

  index do
    column :avatar do |u|
      image_tag u.avatar.url(:minimal)
    end
    column :first_name
    column :last_name
    column :specialty do |u|
      u.specialty
    end
    column :email
    column :phone
    column :show_teacher
    column  :role_ids do |u|
      u.roles.map{|r| r.name}
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :avatar
      f.input :first_name
      f.input :last_name
      f.input :show_teacher
      f.input :trial_lesson
      f.input :specialty, :as => :ckeditor, input_html: { ckeditor: { toolbar: 'mini' } }
      f.input :phone
      f.input :email
      f.input :roles, :label => 'Слайд', :as => :select, :collection =>Role.all.map{|r| [r.name, r.id]}
      f.input :head_message
      f.input :message
      f.input :social_link
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end


end
