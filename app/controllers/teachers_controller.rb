class TeachersController < ApplicationController
  layout "person"
  def index
    if user_signed_in?
      @user = current_user
      if @user.has_role? :user
        redirect_to user_root_path
      end
      date_table =  ActiveTable.where('date < ? and active = ? ', Date.today, true)
      date_table.update_all(active: false) if date_table.present?
      time_table =  ActiveTable.where('date = ? and active = ? and time_start <= ?', Date.today, true, Time.now.to_s(:time))
      time_table.update_all(active: false) if time_table.present?

      @time_table = ActiveTable.order(:date,:time_start).where(' date >= ? and teacher_id = ?', Date.today.monday - 1.day, @user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def timetable_options
    if timetable_params[:category].blank?
      @time_table = ActiveTable.order(:date,:time_start).where(' date >= ? and teacher_id = ?', Date.today.monday - 1.day, current_user.id)
    else
      @time_table = ActiveTable.order(:date,:time_start).where(active: true)
    end
  end

  def add_edit_phone
    @id = params[:id]
    @user = User.find @id
  end


  def edit_avatar
    @user = User.find  params[:id]
    @user.avatar = params[:user][:avatar]
    if @user.save
      @answer = true
    else
      @answer = false
    end
  end

  def edit_phone
    @user = User.find  params[:id]
    @user.phone = params[:phone]
    if @user.save
      @answer = true
    else
      @answer = false
    end
  end

  def edit
    if user_signed_in?
      if current_user.has_role? :user
        redirect_to user_root_path
      end

      @lesson = ActiveTable.find(params[:id])
      @user =  @lesson.users.order(:last_name)

      # активация абонемента
      @user.each do |user|
        subscription = user.subscriptions
        subscription.each do |order|
          if order.date_start <= Date.today
            order.update(active: true)
          end
        end
        order = user.subscriptions.where('order_destroy = ? and active = ?', true, true)
        if order.present?
          order.each do |order|
            cash_count = order.cash.cash_count
            if cash_count <= 0
              order.update(order_destroy: false, date_start: Date.today, date_finish: Date.today + 29)
              order.cash.update(cash_count: order.count + cash_count, date_finish: Date.today + 29)
              user.update(cash_sort: order.cash.cash_sort)
            end
          end
        end
      end

      @filterrific = initialize_filterrific(
          User.with_role(:user).where.not(id: @user.pluck(:id)).order(:last_name),
          params[:filterrific]
      ) or return

      @current_user = current_user
      if @current_user.present? && (@current_user.has_role? :user)
        redirect_to user_root_path
      end

      # id = @user.pluck(:id)
      # @new_users = User.with_role(:user).order(:last_name)
      @new_users = @filterrific.find.page(params[:page])

      @subscriptions = Subscription.where(user: @user, paid: false)
    else
      redirect_to new_user_session_path
    end
  end

  def add_no_registration

    @table = ActiveTable.find(params[:id])
    @table.no_registration += 1
    @table.place_current -= 1
    if @table.save
      @answer = true
    end
  end

  def remove_no_registration
    @table = ActiveTable.find(params[:id])
    if @table.no_registration > 0
      @table.no_registration -= 1
      @table.place_current += 1
      if @table.save
        @answer = true
      end
    end
  end

  def paid
   user = current_user
   @subscription = Subscription.find(params[:id])
   @subscription.update(paid: true, date_paid: Time.now, teacher_id: user.id, teacher_name: "#{user.last_name} #{user.first_name}")
  end

  def delete_paid
    @subscription = Subscription.find(params[:id])
    @subscription.update(paid: false, date_paid: nil, teacher_id: nil, teacher_name: nil)
  end

  def registration_user
    i = 0
    loop do
      random = Random.rand(100000...999999)
      i += 1
      @user = User.new first_name: user_params[:first_name],
                       last_name: user_params[:last_name],
                       phone: user_params[:phone].blank? ? 11111111111 : user_params[:phone],
                       email: random.to_s + '@sport.ru',
                       password: random,
                       avatar: user_params[:avatar],
                       confirm: true,
                       auto_registration: params[:id]

      break if @user.valid? or i == 5
    end

    if @user.save
      lesson = ActiveTable.find(params[:id])
      cash = @user.cashes.find_by(cash_sort: @user.cash_sort)
      place = lesson.place_current
      count = cash.cash_count
      @user.active_tables << lesson
      cash.update(cash_count: count-1)
      lesson.update(place_current: place-1)
      @answer = true
    else
      @answer = false
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :avatar)
  end

  def timetable_params
    params.require(:publication).permit(:category)
  end
end