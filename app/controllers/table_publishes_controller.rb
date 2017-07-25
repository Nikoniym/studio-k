class TablePublishesController < ApplicationController
  def publish
    TablePublish.destroy_all
    table = Timetable.order(day_week_id: :asc).joins(:time_spending).order('time_spendings.time_start asc')
    date_week = 'Понедельник'

    table.each do |t|
      dw = t.day_week.name
      if date_week != dw
        date_week = dw
      end
      data = {day_week: t.day_week.name}

      data[:time_spending] = t.time_spending.name if t.time_spending.present?
      data[:training_name] = t.training_name.name if t.training_name.present?
      data[:teacher] = t.user.first_name if t.user.present?
      data[:teacher_id] = t.user.id if t.user.present?
      data[:place] = t.place
      data[:time_start] = t.time_spending.time_start if t.time_spending.present?
      data[:name_shot] = t.training_name.name_shot if t.training_name.present?

      TablePublish.create(data)
    end
    flash[:message] = 'Расписание опубликовано успешно'
    redirect_to admin_timetables_path
  end

  def filter
    param = params[:publication][:category]
    param = 'all' if param.blank?
    @time_table = TablePublish.new.show_table(param,param)
    end
end