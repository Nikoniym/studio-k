class LessonsController < ApplicationController
  def add_user
    @lesson = ActiveTable.find(params[:teacher_id])
    @user = User.find(params[:id])
    if @lesson.users.where(id: @user).empty?
      cash = @user.cashes.find_by(cash_sort: @user.cash_sort)
      place = @lesson.place_current
      count = cash.cash_count

      @user.active_tables << @lesson

      cash.update(cash_count: count-1)
      @lesson.update(place_current: place-1)
      @answer = true

      user =  @lesson.users.with_role(:user).order(:last_name)
      @subscriptions = Subscription.where(user: user).where(paid: false)
    else
      @answer = false
    end

  end

  def remove_user
    @lesson = ActiveTable.find(params[:teacher_id])
    @user = User.find(params[:id])


    if @lesson.users.where(id: @user).present?
      cash = @user.cashes.find_by(cash_sort: @user.cash_sort)
      place = @lesson.place_current
      count = cash.cash_count

      @lesson.users.delete(@user)

      cash.update(cash_count: count+1)
      @lesson.update(place_current: place+1)
      @answer = true

      user =  @lesson.users.with_role(:user).order(:last_name)
      @subscriptions = Subscription.where(user: user).where(paid: false)

      # @user_lesson =  @lesson.users.pluck(:id)
      # @filterrific = initialize_filterrific(
      #     User.with_role(:user).where.not(id: @user_lesson).order(:last_name),
      #     params[:filterrific]
      # ) or return
      # @new_users = @filterrific.find.page(params[:page])
    end
  end

  def teacher_nav
    @param = params[:teacher_id]

    case @param
      when '1'
        @lesson = ActiveTable.find(params[:id])
        @user =  @lesson.users.order(:last_name)
      when '2'
        @table = ActiveTable.find(params[:id])
        @user =  @table.users.order(:last_name)
        @subscriptions = Subscription.where(user: @user, order_destroy: true, teacher_id: current_user, paid: true)
        @total = 0
      when '3'
        @user = User.new
        @auto_users = User.where auto_registration: params[:id]
    end
  end

  def subscriptions
    @user = User.find params[:teacher_id]
    # @family = User.where(last_name: @user.last_name)
    @subscription = Subscription.new
    @orders = @user.subscriptions.where(order_destroy: true)
    @subscriptions = @user.subscriptions.page(params[:page]).where(order_destroy: false).order(created_at: :desc)
    @cash_sort = CashSort.all
    if @user.trial_lesson
      @select_cash = SelectCash.where(cash_sort_id: 1,  trial_lesson: true).order(:price)
    else
      @select_cash = SelectCash.where(cash_sort_id: 1, subscription: true).order(:price)
    end
    @sort_id = '1'
    @users_cash = @user.cashes.where(cash_sort_id: 2)
    @birth_date = @user.birth_date.present? ? @user.birth_date.find_age : nil
  end

  def change_cash
    @user = User.find params[:user]
    @table = ActiveTable.find params[:table]

    if cash_params[:category].present?
      cash_sort = cash_params[:category]
    else
      cash_sort = '1'
    end

    if @user.cash_sort_id.to_s != cash_sort
      if @table.users.where(id: @user).present?
        cash = @user.cashes.find_by(cash_sort: @user.cash_sort)
        count = cash.cash_count
        cash.update(cash_count: count+1)

        @user.update(cash_sort_id: cash_sort)

        cash = @user.cashes.find_by(cash_sort: cash_sort)
        count = cash.cash_count
        cash.update(cash_count: count-1)

        @answer = true
      end
    end
  end

  def destroy_subscription
    @order = Subscription.find(params[:teacher_id])
    user = User.find @order.user_id
    user.update(trial_lesson: true) if @order.trial_lesson
    if @order.destroy
      @table = ActiveTable.find(params[:id])
      @user =  @table.users.order(:last_name)
      @subscriptions = Subscription.where(user: @user, order_destroy: true, teacher_id: current_user, paid: true)
      @total = 0
    end
  end

  private

  def cash_params
    params.require(:publication).permit(:category)
  end
end