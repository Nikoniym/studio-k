ActiveAdmin.register SelectCash do
  menu priority: 3
  config.clear_sidebar_sections!
  actions :all, :except => [:show]
  config.sort_order = 'cash_sort_id and price '
  permit_params :name, :price, :count, :cash_sort_id, :subscription, :trial_lesson, :long_time

  controller do
    def scoped_collection
      end_of_association_chain.order(:cash_sort_id).order(:price)
    end
  end

  index do
    column :name
    column :price
    column :count
    column :cash_sort_id
    column :subscription
    column :trial_lesson
    column :long_time

    actions
  end

end
