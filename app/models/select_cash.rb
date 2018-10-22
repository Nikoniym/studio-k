class SelectCash < ApplicationRecord
  has_many :subscriptions
  belongs_to :cash_sort

  def name_with_price
    "#{name} - #{price}р"
  end

  def self.list_subscriptions(user, sort_id)
    if user.trial_lesson
      where(cash_sort_id: sort_id, trial_lesson: true).order(:price)
    else
      where(cash_sort_id: sort_id, subscription: true).order(:price)
    end
  end

  def add_trial_lesson
    count > 1 ? (count + 1) : count
  end
end
