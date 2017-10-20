class StatisticsController < ApplicationController
  layout "person"

  def index
    users = User.order(:last_name).with_role(:teacher)
    @statistics = {}
    @total = [{:lesson_count=>0, :user_count=>0, :paid=>0}, {:lesson_count=>0, :user_count=>0, :paid=>0}, {:lesson_count=>0, :user_count=>0, :paid=>0}, {:lesson_count=>0, :user_count=>0, :paid=>0},{:lesson_count=>0, :user_count=>0, :paid=>0}]
    interval = [Date.today - 1.day, Date.today, Date.today.beginning_of_week, Date.today.beginning_of_month, Date.today.beginning_of_year]

    users.each do |user|
      tables = ActiveTable.where(teacher_id: user.id, active: false)
      varibals_hash = []

      interval.each_with_index do |int, index|
        user_count = 0
        paid = 0

        tables.where(date: int..(index==0 ? Date.today : Date.today + 1.day)).each do |table|
          user_count += table.users.count
        end

        subscriptions = Subscription.where(date_paid: int..(index==0 ? Date.today : Date.today + 1.day), teacher_id: user, paid: true)

        subscriptions.each do |sub|
          paid += sub.price
        end

        table_count = tables.where(date: int..(index==0 ? Date.today : Date.today + 1.day)).count
        varibals_hash[index] = {lesson_count: table_count, user_count: user_count, paid: paid}

        #итого
        @total[index][:lesson_count] += table_count
        @total[index][:user_count] += user_count
        @total[index][:paid] += paid
      end
      @statistics[user] = varibals_hash
    end
  end

  def detail
    generate_table(params[:id])
  end


  def date_picker
    generate_table(params[:id], params[:date_start], params[:date_finish])
  end

  private

  def generate_table (id, date_start = Date.today, date_finish = nil)

    date_start = date_start.to_date if date_start.present?

    date_finish = date_finish.to_date if date_finish.present?

    @total = [0,0]
    if id == 'total'
      @user = User.with_role(:teacher)
    else
      @user = User.find id
    end

    if date_start.present? && date_finish.blank?
      lessons = ActiveTable.where(teacher_id: @user, date: date_start).order(:date,:time_start)
      subscriptions = Subscription.where(teacher_id: @user, paid: true, date_paid: date_start..date_start + 1.day)
    else
      lessons = ActiveTable.where(teacher_id: @user, date: date_start..date_finish).order(:date,:time_start)
      subscriptions = Subscription.where(teacher_id: @user, paid: true, date_paid: date_start..date_finish + 1.day)
    end


    trainings = lessons.pluck(:training_name).uniq
    @lessons = {}
    trainings.each do |training|
      lesson_training = lessons.where(training_name: training)
      if date_start.present? && date_finish.blank?
        lesson_training.each do |table|
          training = table.time_spending + ' ' + table.training_name
          @lessons[training] = [1]
          @lessons[training][1] = table.users.count
          @total[0] += 1
          @total[1] += table.users.count
        end
      else
        @lessons[training] = [lesson_training.count]

        user_count = 0
        lesson_training.each do |table|
          user_count += table.users.count
        end
        @lessons[training][1] = user_count
        @total[0] += lesson_training.count
        @total[1] += user_count
      end
    end
    puts @lessons
    puts @total
    #Полученно денег
    @paid = 0
    subscriptions.each do |sub|
      @paid += sub.price
    end
  end
end