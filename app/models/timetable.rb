class Timetable < ApplicationRecord
  belongs_to :day_week
  belongs_to :time_spending
  belongs_to :training_name
  belongs_to :user
end
