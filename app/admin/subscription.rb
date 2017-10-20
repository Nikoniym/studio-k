ActiveAdmin.register Subscription do
  menu priority: 2
  config.sort_order = 'created_at desc'
  config.per_page = 100

  actions :all, :except => [:show]
  permit_params :paid , :date_paid, :teacher_name

  index do
    column 'Фамилия' do |t|
      t.user.last_name
    end
    column 'Имя' do |t|
      t.user.first_name
    end
    column :active
    column :confirm
    column :order_destroy
    column :date_start
    column :date_finish
    column :count
    column :price
    column :paid
    column :date_paid
    column :teacher_name


    actions
  end

  form do |f|

    f.inputs do
      f.input :paid
      f.input :date_paid
      f.input :teacher_name, :label => 'Имя преподавателя', :as => :select, :collection => User.with_role(:teacher).map{|u| "#{u.first_name} #{u.last_name}"}
    end
    f.actions
  end


end
