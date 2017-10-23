class Cash < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :subscriptions
  belongs_to :cash_sort
end
