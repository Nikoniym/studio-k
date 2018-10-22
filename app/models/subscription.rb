class Subscription < ApplicationRecord
  belongs_to :cash
  belongs_to :select_cash
  belongs_to :user
  accepts_nested_attributes_for :user
  self.per_page = 5

  ADULT_AGE = 14
end
