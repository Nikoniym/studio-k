ActiveAdmin.register SelectCash do
  actions :all, :except => [:show]
  permit_params :name, :price, :count, :cash_sort_id, :subscription


  index do
    column :name
    column :price
    column :count
    column :cash_sort_id
    # column :subscription

    actions
  end

end
