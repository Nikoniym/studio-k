class ActiveTablesController < ApplicationController
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
      cash.update(cash_count: count+1)
      @lesson.update(place_current: place+1)

      @lesson.users.delete(user)

      @table_current = user.active_tables.order(:date,:time_start).where(active: true)

      @cash_current = user.cashes.find_by(cash_sort: user.cash_sort)
      @cash_current_count = user.cashes.find_by(cash_sort: user.cash_sort).present? ?
          @cash_current.cash_count : 0
      @answer = false
    end
  end

  def filter
    param = params[:publication][:category]
    @time_table=ActiveTable.order(:date,:time_start).where(' active = ?', true).tran_name(param.present? ? param : nil)
    @user = current_user
  end

end