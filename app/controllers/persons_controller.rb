class PersonsController < ApplicationController
  layout "person", except: [:edit_user, :update_user]

  def edit_avatar
    @user = current_user
  end

  def update_avatar
    @user = current_user
    if params[:width].present?
      @width = params[:width]
    end
    if params[:user].present?
      @user.update(user_params)
    end
  end

  def remove_message
    user = current_user
    user.update(message: nil, head_message: nil)
  end

  def avatar
    @user = current_user
  end

  def edit_user
    @user = current_user
    @select = @user.cashes.joins(:cash_sort).select('cash_sorts.id, cash_sorts.name')
  end

  def update_user
    @user = current_user
    if @user.update(user_params)
      redirect_to user_root_path
    else
      @select = @user.cashes.joins(:cash_sort).select('cash_sorts.id, cash_sorts.name')
      render :edit_user
    end
  end

  def profile
    if user_signed_in?
      @user = current_user
      if @user.has_role? :teacher
        redirect_to teachers_path
      end

      # Обработка кошелька
      @cash_current = @user.cashes.find_by(cash_sort: @user.cash_sort)
      @cash_current_count = @cash_current.cash_count if @cash_current.present?

      if @cash_current_count > 0 && @cash_current.date_finish < Date.today
        @cash_current.update(cash_count: 0)
      end

      if @cash_current_count == 0
        @user.cashes.each do |cash|
          if cash.cash_count > 0
            @user.update(cash_sort: cash.cash_sort)
            @cash_current = @user.cashes.find_by(cash_sort: @user.cash_sort)
            @cash_current_count = @cash_current.cash_count
          end
        end
      end

      # активация абонемента
      subscription = @user.subscriptions
      subscription.each do |order|
        if order.date_start <= Date.today
          order.update(active: true)
        end

      end
      order = @user.subscriptions.where('order_destroy = ? and active = ?', true, true)
      if order.present?
        order.each do |order|
          cash_count = order.cash.cash_count
          if cash_count <= 0
            order.update(order_destroy: false, date_start: Date.today, date_finish: Date.today + 29)
            order.cash.update(cash_count: order.count + cash_count, date_finish: Date.today + 29)
            @user.update(cash_sort: order.cash.cash_sort)
            @cash_current_count = @user.cashes.find_by(cash_sort: @user.cash_sort).cash_count
          end


        end
      end

      # @cash_current = @user.cashes.find_by(cash_sort: @user.cash_sort)
      # @cash_current_count = @cash_current.cash_count if @cash_current.present?

      # контроллер

      date_table =  ActiveTable.where('date < ? and active = ? ', Date.today, true)
      date_table.update_all(active: false) if date_table.present?
      time_table =  ActiveTable.where('date = ? and active = ? and time_start <= ?', Date.today, true, Time.now.to_s(:time))
      time_table.update_all(active: false) if time_table.present?
      @time_table = ActiveTable.order(:date,:time_start).where(' active = ?', true)
      @table_current=@user.active_tables.order(:date,:time_start).where(active: true)
    else

      redirect_to new_user_session_path
    end




  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :specialty, :phone, :avatar, :cash_sort_id, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end

end
