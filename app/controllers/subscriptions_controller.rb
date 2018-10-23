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
    @user = User.find params[:user_control]

    #Устанавливаю флаги для корректного отображения собщений через ajax в create.js.erb
    flash[:answer] = false
    flash[:notice] = false

    update_birth_date

    # Проверяем наличие не оплаченного абонемента
    if @user.paid_subscriptions?
      #Находим вариант абонемента и устанавливаем вид абонемента и длительность
      select_cash = SelectCash.find(subscription_params[:select_cash_id])
      cash_sort = select_cash.cash_sort.id
      long_time = select_cash.long_time

      # проверка на детский и создаем новую подписку для всех тарифов
      if (cash_sort == 3 && @user.child_age? ) || cash_sort != 3
        #Кошелек пользователя и если кошелька данного вида нет то создаю новый
        cash = @user.cashes.find_by(cash_sort_id: cash_sort)
        cash = @user.cashes.create!(cash_sort_id: cash_sort , cash_count: 0, last_name: @user.full_name)  if cash.nil?

        set_date_start

        # Для поздней активации, чтобы не затереть текущий абонемент
        confirm = cash.confirm?(@date_start)

        #При наличии пробного занятия, прибавление его к абонементу
        cash_count = @user.trial_lesson ? select_cash.add_trial_lesson : select_cash.count

        @subscription = Subscription.new(
            active: false,
            count: cash_count,
            price: select_cash.price,
            date_start: @date_start,
            date_finish:  (long_time ? @date_start + 39 : @date_start + 29),
            paid: false,
            select_cash_id: subscription_params[:select_cash_id],
            cash: cash,
            confirm: confirm,
            tariff: select_cash.cash_sort.name,
            user: @user,
            order_destroy: true,
            trial_lesson: @user.trial_lesson ? true : false
        )

        teacher_create
        subscription_save
      else
        flash[:notice] = "Заполните поле даты рождения."
      end
    else
      flash[:notice] = "Невозможно заказать абонемет, так как уже есть неоплаченный."
    end
  end

  def destroy
    @order = Subscription.find(params[:id])

    #Востановление пробного занятия
    user = User.find @order.user_id
    user.update(trial_lesson: true) if @order.trial_lesson

    @order.destroy
  end

  private

  def set_date_start
    #Установка дату начала, и что делать если она не указана, либо указана неверно.
    if subscription_params[:date_start].present?
      @date_start = subscription_params[:date_start].to_date
    else
      @date_start = Date.today
    end

    @date_start = Date.today if Date.today > @date_start
  end

  def subscription_save
    #Сохранение подписки c учетом использования как пользователем так и учителем
    if (current_user.has_role? :teacher) && @user.subscriptions.where(order_destroy: true).present?
      flash[:notice] = "Уже заказан"
    else
      if @subscription.save!
        @order = @user.subscriptions.find_by(order_destroy: true)
        @user.update(trial_lesson: false) if @user.trial_lesson
      end
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
        flash[:answer] = true
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

