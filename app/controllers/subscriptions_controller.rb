class SubscriptionsController < ApplicationController
  layout "person"
  require 'adroit-age'

  before_action :authenticate_user!

  # @sort_id
  # cash_sort
  # Тарифы:
  # 1 - Личный
  # 2 - Семейный
  # 3 - Детский

  def index
    # Необходима так как форма используется не только у пользователя но и у преподавателя.
    @user = current_user

    @subscription = Subscription.new
    # Созданные и не актевированные подписки
    @order = @user.subscriptions.find_by(order_destroy: true)
    # Список активированных подписок (история)
    @subscriptions = @user.subscriptions.where(order_destroy: false).order(created_at: :desc).page(params[:page])
    # Список возможных абонементов с учетом пробного занятия и активного тарифа
    @select_cash = SelectCash.list_subscriptions(@user, @user.cash_sort_id)
    # Вид абонемента используемый пользователем
    @sort_id = @user.cash_sort_id.to_s
  end

  def create
    @list_of_subscribers = false
    @user = User.find params[:user_control]
    update_birth_date

    @subscription = Subscription.new(
        active: false,
        date_start: subscription_params[:date_start].to_date,
        paid: false,
        select_cash_id: subscription_params[:select_cash_id],
        user: @user,
        order_destroy: true,
        trial_lesson: @user.trial_lesson ? true : false
    )

    teacher_create
    subscription_save
  end

  def destroy
    @order = Subscription.find(params[:id])
    @order.destroy
  end

  private

  def subscription_save
    #Сохранение подписки c учетом пробного занятия
    if @subscription.save
      @order = @subscription
      @user.update(trial_lesson: false) if @user.trial_lesson
    end
  end

  def teacher_create
    #Если абонемент заказывает преподаватель для ученика на занятии.
    if (current_user.has_role? :teacher)
      @subscription.paid = true
      @subscription.date_paid = Time.now
      @subscription.teacher_id =  current_user.id
      @subscription.teacher_name = current_user.full_name
    end
  end

  def update_birth_date
    # Обновление даты юзера и формат вывода детсякого тарифа (форма или список)
    if  user_params && user_params[:birth_date].present?
      @user.update(birth_date: user_params[:birth_date])
      if @user.adult_age?
        @list_of_subscribers = true
        @select_cash = SelectCash.list_subscriptions(@user, 3)
      end
    end
  end

  def subscription_params
    params.require(:subscription).permit(:select_cash_id, :date_start)
  end

  def user_params
    #Так как поле присутствует в общей форме только в детском тарифе, выполняется проверка
    params[:user].present? ? params.require(:user).permit(:birth_date) : false
  end
end

