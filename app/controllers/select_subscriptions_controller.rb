class SelectSubscriptionsController < ApplicationController
  layout "person"
  require 'adroit-age'

  def select_tariff
    @user = User.find params[:id]
    @sort_id = params[:subscription_id]
    if @user.trial_lesson
      @select_cash = SelectCash.where(cash_sort_id: @sort_id, trial_lesson: true).order(:price)
    else
      @select_cash = SelectCash.where(cash_sort_id: @sort_id, subscription: true).order(:price)
    end
    @family = User.where('last_name ~* ?', @user.last_name.chop.chop).where.not(id: @user)
    @subscription = Subscription.new
    @birth_date = @user.birth_date.present? ? @user.birth_date.find_age : nil
    end
end

