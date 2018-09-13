class AddDatePaidAndTeacherPaidAndTeacherNameToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :date_paid, :datetime
    add_column :subscriptions, :teacher_id, :integer
    add_column :subscriptions, :teacher_name, :string
  end
end
