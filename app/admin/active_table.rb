ActiveAdmin.register ActiveTable do
  menu parent: 'Расписание'
  actions :all, :except => [:show, :destroy]
  permit_params :teacher, :teacher_id, :time_spending, :training_name, :date, :day_week, :place, :place_current, :active, :time_start, :no_registration
  config.sort_order = 'date desc and time_start asc'
  config.per_page = 100

  controller do
   def scoped_collection
     end_of_association_chain.order(active: :desc).order(date: :desc).order(time_start: :asc)
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
    column :teacher
    column :teacher_id

    actions  do |table|
      item 'Отменить занятие', edit_cancel_admin_path(table)
    end
  end

  form do |f|

   f.inputs do
     f.input :active, :label => 'Активно'
     f.input :time_spending, :label => 'Интервал времени', :as => :select, :collection => TimeSpending.order(:time_start).map{|u| u.name}
     f.input :time_start, :label => 'Время начала'
     f.input :training_name, :label => 'Название занятия', :as => :select, :collection => TrainingName.all.map{|u| u.name}
     f.input :date, :label => 'Дата', :as => :datepicker
     f.input :day_week, :label => 'День недели', :as => :select, :collection => DayWeek.all.map{|u| u.name }
     f.input :place, :label => 'Кол-во мест'
     f.input :place_current, :label => 'Текущее кол-во мест'
     f.input :teacher, :label => 'Имя преподавателя', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.first_name] }
     f.input :teacher_id,  :label => 'Id преподавателя', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
   end
   f.actions
  end

  action_item :only => :index do
    link_to "Сгенерировать день", load_day_active_table_path('load_day')

  end
end
