class SubscriptionsController < ApplicationController
  layout "person"
  require 'adroit-age'

  def select_tariff
    @user = current_user
    @sort_id = params[:id]
    @select_cash = SelectCash.where(cash_sort_id: @sort_id, subscription: true).order(:price)
    @family = User.where('last_name ~* ?', @user.last_name.chop.chop).where.not(id: @user)
    @subscription = Subscription.new
    @birth_date = @user.birth_date.present? ? @user.birth_date.find_age : nil
  end

  def confirm
    @subscription = Subscription.find(params[:id])
    @subscription.update(confirm: false)

  end
  def index
    if user_signed_in?
      @user = current_user
      # @family = User.where(last_name: @user.last_name)
      @subscription = Subscription.new
      @orders = @user.subscriptions.where(order_destroy: true)
      @subscriptions = @user.subscriptions.page(params[:page]).where(order_destroy: false).order(created_at: :desc)
      @cash_sort = CashSort.all
      @select_cash = SelectCash.where(cash_sort_id: 1, subscription: true).order(:price)
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
    @user = current_user

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
      cash_sort = select_cash.cash_sort
      # проверка на детский
      if (cash_sort.id == 3 && ((user_params && user_params[:birth_date].present? && user_params[:birth_date].to_date.find_age < 18) || (@user.birth_date.present? && @user.birth_date.find_age < 18))) || cash_sort.id != 3
        cash = @user.cashes.find_by(cash_sort: cash_sort)
        cash = @user.cashes.create!(cash_sort: cash_sort , cash_count: 0)  if cash.nil?

        if @user.cash_sort.blank? || @user.cashes.blank? || @user.cashes.find_by(cash_sort: @user.cash_sort).cash_count == 0
          @user.update(cash_sort: cash_sort)
        end

        # семейный тариф
        # unless subscription_params[:user].nil? || subscription_params[:user].empty?
        #   user_ids = subscription_params[:user]
        #   user_ids.delete_at(0)
        #   @users = User.find(user_ids)
        #   @users.each do |u|
        #     cash.users << u
        #   end
        # end


        if subscription_params[:date_start].present?
          date_start = subscription_params[:date_start].to_date
        else
          date_start =  Date.today
        end


        if Date.today >  date_start
          date_start =  Date.today
        end

        if cash.cash_count > 0 && cash.date_finish >= date_start
          confirm = true
        else
          confirm = false
        end


        @subscription = Subscription.new(
            active: false,
            count: select_cash.count,
            price: select_cash.price,
            date_start: date_start,
            date_finish:  date_start + 29,
            paid: false,
            select_cash_id: subscription_params[:select_cash_id],
            cash: cash,
            confirm: confirm,
            user: @user,
            order_destroy: true
        )


        if @subscription.save!
          @orders = @user.subscriptions.where(order_destroy: true).order(created_at: :desc)
        else
          render :index
        end
        # else
        #   @answer = 'Необходимо выбрать из списка членов семьи'

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
    @order.destroy
    redirect_to subscriptions_path
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

