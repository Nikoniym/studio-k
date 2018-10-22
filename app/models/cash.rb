class Cash < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :subscriptions
  belongs_to :cash_sort

  def confirm?(date_start)
    cash_count > 0 && date_finish >= date_start
  end
end
