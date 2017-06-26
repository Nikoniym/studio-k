class SelectCash < ApplicationRecord
  has_many :subscriptions
  belongs_to :cash_sort

  def name_with_price
    "#{name} - #{price}р"
  end
end
