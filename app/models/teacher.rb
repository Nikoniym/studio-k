class Teacher < ApplicationRecord
  has_many :timetables
  belongs_to :user
end
