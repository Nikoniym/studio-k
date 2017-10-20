class LessonsAdminsController < ApplicationController
  def remove_user
    @lesson = ActiveTable.find(params[:cancel_admin_id])
    @user = User.find(params[:id])

    if @lesson.users.where(id: @user).present?
      cash = @user.cashes.find_by(cash_sort: @user.cash_sort)
      place = @lesson.place_current
      count = cash.cash_count

      @lesson.users.delete(@user)

      cash.update(cash_count: count+1)
      @lesson.update(place_current: place+1)
      @answer = true

      message = "#{@lesson.day_week} #{ l @lesson.date, format: :standard} #{@lesson.time_spending} #{@lesson.training_name}"
      @user.update(message: message, head_message: 'Занятие отменено!')

      user =  @lesson.users.with_role(:user).order(:last_name)
      @subscriptions = Subscription.where(user: user).where(paid: false)
    end

    if @lesson.users.blank?
      @lesson.destroy
      @destroy = true
    end
  end
end