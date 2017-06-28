ActiveAdmin.register Timetable do

  config.sort_order = 'time_spendings.time_start asc and day_week_id asc'
  config.per_page = 100

  actions :all, :except => [:show]
  permit_params :day_week_id , :time_spending_id, :training_name_id, :user_id , :place

  controller do
    def scoped_collection
      end_of_association_chain.order(day_week_id: :asc).joins(:time_spending).order('time_spendings.time_start asc')
    end
  end



  index do
    column :day_week
    column :time_spending
    column :training_name
    column :user do |t|
      t.user.first_name if t.user.present?
    end
    column :place

    actions
  end

  form do |f|

    f.inputs do
      f.input :day_week
      f.input :time_spending, :label => 'Время', :as => :select, :collection => TimeSpending.order(:time_start).map{|u| [u.name, u.id]}
      f.input :training_name
      f.input :user, :label => 'Преподаватель', :as => :select, :collection => User.with_role(:teacher).map{|u| ["#{u.first_name} #{u.last_name}", u.id]}
      f.input :place
    end
    f.actions
  end
  def display_name
    "Order number - #{id}"
  end
  action_item :only => :index do
    link_to "Опубликовать", table_publishes_publish_path, remote: true
  end


  # sidebar "Active Admin Demo" do
  #   link_to 'dfsf', '#'
  # end
end
