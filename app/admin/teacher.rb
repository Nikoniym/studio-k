ActiveAdmin.register Teacher do
  actions :all, :except => [:show]
  permit_params :user_id

  index do

    column :user do |t|
      t.user.first_name
    end


    actions
  end

  form do |f|
    f.inputs do
      f.input :user, :label => 'Member', :as => :select, :collection => User.all.map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
    end
    f.actions
  end

end
