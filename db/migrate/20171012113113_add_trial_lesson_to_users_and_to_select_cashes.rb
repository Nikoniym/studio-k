class AddTrialLessonToUsersAndToSelectCashes < ActiveRecord::Migration[5.0]
  def change
    add_column :select_cashes, :trial_lesson, :boolean
    add_column :users, :trial_lesson, :boolean
    add_column :subscriptions, :trial_lesson, :boolean
  end
end
