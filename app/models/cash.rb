class Cash < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :subscriptions
  belongs_to :cash_sort

  def stat
    user = User.find 5
    lessons = ActiveTable.where(teacher_id: user, date: Date.today - 1.day)
    trainings = lessons.pluck(:training_name).uniq
    @lessons = {}
    trainings.each do |training|
      lesson_training = lessons.where(training_name: training)
      @lessons[training] = [lesson_training.count]
      user_count = 0
      lesson_training.each do |table|
        user_count += table.users.count
      end
      @lessons[training][1] = user_count

      puts @lessons
    end




  end
end
