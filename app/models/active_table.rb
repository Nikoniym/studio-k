class ActiveTable < ApplicationRecord
  has_and_belongs_to_many :users

  filterrific :default_filter_params => { :sorted_by => :desc },
              :available_filters => %w[
                sorted_by
                with_training_name
                with_created_at_from
                with_created_at_to
              ]
  # default for will_paginate
  self.per_page = 20

  scope :sorted_by, -> (object) {order(created_at: object)}
  scope :with_training_name, lambda { |training_name|
    where( training_name:  [*training_name])
  }
  scope :with_created_at_from, lambda { |ref_date|
    where('created_at >= ?', ref_date)
  }
  scope :with_created_at_to, lambda { |ref_date|
    where('created_at <= ?', ref_date)
  }
  scope :tran_name, -> (object) { where(training_name: object) if object.present?}

  def create_table
    t_false = ActiveTable.where('date >= ? and active = ?', Date.today, true)
    t_false = t_false.pluck(:day_week).uniq
    if t_false.count < 7
      table = TablePublish.where.not(day_week: t_false)
      t_false = table.first.day_week
      d=Date.today.next_weekA.monday
      case t_false
        when 'Понедельник'
          date_week = 'Понедельник'
        when 'Вторник'
          d+=1
          date_week = 'Вторник'
        when 'Среда'
          d+=2
          date_week = 'Среда'
        when 'Четверг'
          d+=3
          date_week = 'Четверг'
        when 'Пятница'
          d+=4
          date_week = 'Пятница'
        when 'Суббота'
          d+=5
          date_week = 'Суббота'
        when 'Воскресенье'
          d+=6
          date_week = 'Воскресенье'
      end

      table.each do |t|
        dw = t.day_week
        if date_week != dw
          d+=1
          date_week = dw
        end
        data = {day_week: t.day_week}
        data[:date]=d
        data[:time_spending] = t.time_spending
        data[:training_name] = t.training_name
        data[:time_start] = t.time_start
        data[:teacher] = t.teacher
        data[:teacher_id] = t.teacher_id
        data[:place] = t.place
        data[:place_current] = t.place
        data[:no_registration] = 0
        data[:active] = true

        ActiveTable.create(data)
      end
    end
  end
end
