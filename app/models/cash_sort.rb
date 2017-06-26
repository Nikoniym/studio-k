class CashSort < ApplicationRecord
  has_many :users
  has_many :cashes
  has_many :select_cashes

end
