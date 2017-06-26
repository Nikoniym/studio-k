class TablePublish < ApplicationRecord
  scope :tran_name, -> (object) { where(training_name: object) if object.present?}
end
