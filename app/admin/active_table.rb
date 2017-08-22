ActiveAdmin.register ActiveTable do
  menu parent: 'Расписание'
  actions :all, :except => [:show]
  config.sort_order = 'active desc and date asc and time_start asc'
  permit_params :teacher, :teacher_id, :time_spending, :training_name, :date, :day_week, :place, :place_current, :active, :time_start, :no_registration
  config.sort_order = 'date desc and time_start'
  config.per_page = 100

  controller do
   def scoped_collection
     end_of_association_chain.order(active: :desc).order(date: :asc).order(time_start: :asc)
   end
  end


  index do
    column :active
    column :day_week
    column :date
    column :time_spending
    column :time_start do |t|
     t.time_start.strftime("%H:%M")
    end
    column :training_name
    column :place
    column :place_current
    column :no_registration
    column :teacher
    column :teacher_id

    actions
  end

  form do |f|

   f.inputs do
     f.input :active
     f.input :time_spending
     f.input :time_start
     f.input :training_name
     f.input :date
     f.input :day_week, :label => 'День недели', :as => :select, :collection => DayWeek.all.map{|u| u.name }
     f.input :place
     f.input :place_current
     f.input :no_registration
     f.input :teacher, :label => 'Имя преподавателя', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.first_name] }
     f.input :teacher_id,  :label => 'Id преподавателя', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
   end
   f.actions
  end


end
