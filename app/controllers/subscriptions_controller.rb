class SubscriptionsController < ApplicationController
  layout "person"
  require 'adroit-age'

  # def select_tariff
  #   @user = current_user
  #   @sort_id = params[:id]
  #   @select_cash = SelectCash.where(cash_sort_id: @sort_id, subscription: true).order(:price)
  #   @family = User.where('last_name ~* ?', @user.last_name.chop.chop).where.not(id: @user)
  #   @subscription = Subscription.new
  #   @birth_date = @user.birth_date.present? ? @user.birth_date.find_age : nil
  # end

  # def confirm
  #   @subscription = Subscription.find(params[:id])
  #   @subscription.update(confirm: false)
  # end

  def index
    if user_signed_in?
      @user = current_user
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
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @subscription = Subscription.find(params[:id])

  end

  def create
    @user = User.find params[:user_control]

    flash[:answer] = false
    flash[:notice] = false

    # Обновление даты юзера
    if  user_params && user_params[:birth_date].present?
      @user.update(birth_date: user_params[:birth_date])
      if @user.birth_date.find_age >= 18
        flash[:answer] = true
        @select_cash = SelectCash.where(cash_sort_id: 3).order(:price)
      end
    end



    if @user.subscriptions.find_by(paid: false).blank?
      # current_cash = @user.cashes.find_by(cash_sort_id: subscription_params[:select_cash_id])
      select_cash = SelectCash.find(subscription_params[:select_cash_id])
      cash_sort = select_cash.cash_sort.id
      # проверка на детский
      if (cash_sort == 3 && ((user_params && user_params[:birth_date].present? && user_params[:birth_date].to_date.find_age < 14) || (@user.birth_date.present? && @user.birth_date.find_age < 14))) || cash_sort != 3
        cash = @user.cashes.find_by(cash_sort_id: cash_sort)
        cash = @user.cashes.create!(cash_sort_id: cash_sort , cash_count: 0, last_name: @user.full_name)  if cash.nil?

        if @user.cash_sort.blank? || @user.cashes.blank? || @user.cashes.find_by(cash_sort: @user.cash_sort).cash_count ==0
          @user.update(cash_sort_id: cash_sort)
        end

        if subscription_params[:date_start].present?
          date_start = subscription_params[:date_start].to_date
        else
          date_start =  Date.today
        end


        if Date.today >  date_start
          date_start =  Date.today
        end
        # Для поздней активации, чтобы не затереть текущий абонемент
        if cash.cash_count > 0 && cash.date_finish >= date_start
          confirm = true
        else
          confirm = false
        end

        #trial activation
        if @user.trial_lesson
          if select_cash.count > 1
            cash_count = select_cash.count + 1
          else
            cash_count = select_cash.count
          end
        else
          cash_count = select_cash.count
        end

        @subscription = Subscription.new(
            active: false,
            count: cash_count,
            price: select_cash.price,
            date_start: date_start,
            date_finish:  date_start + 29,
            paid: (current_user.has_role? :teacher) ? true : false,
            select_cash_id: subscription_params[:select_cash_id],
            cash: cash,
            confirm: confirm,
            tariff: select_cash.cash_sort.name,
            user: @user,
            order_destroy: true,
            trial_lesson: @user.trial_lesson ? true : false
        )

        #teacher paid
        if (current_user.has_role? :teacher)
          @subscription.date_paid = Time.now
          @subscription.teacher_id =  current_user.id
          @subscription.teacher_name = "#{current_user.last_name} #{current_user.first_name}"
        end

        if (current_user.has_role? :teacher) && @user.subscriptions.where(order_destroy: true).present?
          flash[:notice] = "Уже заказан"
        else
          if @subscription.save!
            @orders = @user.subscriptions.where(order_destroy: true).order(created_at: :desc)
            @user.update(trial_lesson: false) if @user.trial_lesson
          else
            render :index
          end
        end


      else
        flash[:notice] = "Заполните поле даты рождения."
      end
    else
      flash[:notice] = "Невозможно заказать абонемет, так как уже есть неоплаченный."
    end



    respond_to do |format|
      format.js
    end
  end

  def destroy
    @order = Subscription.find(params[:id])
    user = User.find @order.user_id
    user.update(trial_lesson: true) if @order.trial_lesson
    @order.destroy
    # redirect_to subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:select_cash_id, :date_start, :user => [])
  end

  def user_params
    if params[:user].present?
      params.require(:user).permit(:birth_date)
    else
      false
    end
  end
end

