class SelectSubscriptionsController < ApplicationController
  layout "person"

  def select_tariff
    @user = User.find params[:id]
    @sort_id = params[:subscription_id]
    @select_cash = SelectCash.list_subscriptions(@user, @sort_id)
    @subscription = Subscription.new
  end
end

