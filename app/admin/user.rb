ActiveAdmin.register User do

  actions :all, :except => [:show]
  permit_params :first_name, :last_name, :message, :head_message, :role_ids => []

  index do
    column :avatar do |u|
      image_tag u.avatar.url(:minimal)
    end
    column :first_name
    column :last_name
    column :specialty
    column :email
    column  :role_ids do |u|
      u.roles.map{|r| r.name}
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :roles, :label => 'Слайд', :as => :select, :collection =>Role.all.map{|r| [r.name, r.id]}
      f.input  :head_message
      f.input  :message
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end


end
