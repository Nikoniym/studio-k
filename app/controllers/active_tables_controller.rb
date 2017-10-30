class ActiveTablesController < ApplicationController
  layout "person", only: :load_day

  def entry_lesson
    @lesson = ActiveTable.find(params[:id])
    user = current_user
    if @lesson.users.find_by(id: user.id).nil?
      place = @lesson.place_current
      cash = user.cashes.find_by(cash_sort: user.cash_sort)
      if @lesson.active
        if cash.date_finish >= @lesson.date or cash.cash_count <= 0
          if place > 0
            if cash.cash_count > 0
              user.active_tables << @lesson
              count = cash.cash_count
              cash.update(cash_count: count-1)
              @lesson.update(place_current: place-1)

              @table_current = user.active_tables.order(:date,:time_start).where(active: true)
              @cash_current = user.cashes.find_by(cash_sort: user.cash_sort)
              @cash_current_count = user.cashes.find_by(cash_sort: user.cash_sort).present? ?
                                                  @cash_current.cash_count : 0

              @answer = true
              flash[:message] = 'Занятие добавлено в запись'
            else
              @answer = false
              flash[:message] = 'Пополните счет'
            end
          else
            @answer = false
            flash[:message] = 'Нет свободных мест'
          end
        else
          @answer = false
          flash[:message] = 'Не входит в срок действия абонемента'
        end
      else
        @answer = false
        flash[:message] = 'Запись закрыта'
      end

    else
      @answer = false
    end

  end


  def remove_lesson
    user = current_user
    @lesson = ActiveTable.find(params[:id])
    if @lesson.users.find_by(id: user.id).present?
      cash = user.cashes.find_by(cash_sort: user.cash_sort)
      user = current_user
      place = @lesson.place_current

      count = cash.cash_count
      if (count + 1) <= cash.subscription_limit
        cash.update(cash_count: count+1)
        @answer = false
      else
        @answer = true
        flash[:message] = 'Не возможно привысить лимит абонемента'
      end
      @lesson.update(place_current: place+1)

      @lesson.users.delete(user)

      @table_current = user.active_tables.order(:date,:time_start).where(active: true)

      @cash_current = user.cashes.find_by(cash_sort: user.cash_sort)
      @cash_current_count = user.cashes.find_by(cash_sort: user.cash_sort).present? ?  @cash_current.cash_count : 0
    end
  end

  def filter
    param = params[:publication][:category]
    @time_table=ActiveTable.order(:date,:time_start).where(' active = ?', true).tran_name(param.present? ? param : nil)
    @user = current_user
  end

  def load_day
    @params = params[:id]
    @active_table = ActiveTable.new
  end

  def generate_day
    if table_params[:date].present?
      table_active = ActiveTable.where(date: table_params[:date])
      week_day = table_params[:date].to_date.wday

      if table_active.blank?
        table_p = TablePublish.where(day_week: I18n.t('date.day_names')[week_day] )
        table_p.each do |t|
          data = {day_week: t.day_week}
          data[:date] = table_params[:date]
          data[:time_spending] = t.time_spending
          data[:training_name] = t.training_name
          data[:time_start] = t.time_start
          data[:teacher] = t.teacher
          data[:teacher_id] = t.teacher_id
          data[:place] = t.place
          data[:place_current] = t.place
          data[:no_registration] = 0
          data[:active] = true

          ActiveTable.create (data)
        end
        flash[:notice] = 'День добавлен.'
        redirect_to admin_active_tables_path
      else
        flash[:notice] = 'Сначала этот день необходимо удалить целиком!'
        redirect_to load_day_active_table_path('load_day')
      end
    else
      flash[:notice] = 'Введите дату.'
      redirect_to load_day_active_table_path('load_day')
    end
  end

  private

  def table_params
    params.require(:active_table).permit(:date)
  end
end