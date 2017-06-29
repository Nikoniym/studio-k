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

    table = TablePublish.tran_name(param.present? ? param : nil)
    hash_table(table)
  end

  private

  def hash_table(object)
    table = object
    date_week = object.first.day_week

    @head_class=''
    @table_day=[]
    @time_table={}
    table.each do |t|
      dw = t.day_week
      if date_week == dw
        data = {day_week: t.day_week}
        data[:time_spending] = t.time_spending
        data[:training_name] = t.training_name
        data[:teacher] = t.teacher
        data[:name_class] = t.name_shot
        @head_class += t.name_shot + ' ' unless @head_class.include?(t.name_shot)
        @table_day+=[data]
        @day_name = t.day_week
      else
        @time_table[day_week: @day_name, head_class: @head_class]=@table_day if @table_day.present?
        @table_day=[]
        @head_class=''
        date_week = dw
        data = {day_week: t.day_week}
        data[:time_spending] = t.time_spending
        data[:training_name] = t.training_name
        data[:teacher] = t.teacher
        data[:name_class] = t.name_shot
        @head_class += t.name_shot + ' ' unless @head_class.include?(t.name_shot)
        @table_day+=[data]
        @day_name = t.day_week
      end
    end
    @time_table[day_week: @day_name, head_class: @head_class]=@table_day if @table_day.present?
  end

end