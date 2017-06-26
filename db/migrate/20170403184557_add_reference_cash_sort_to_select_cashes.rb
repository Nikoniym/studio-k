class AddReferenceCashSortToSelectCashes < ActiveRecord::Migration[5.0]
  def change
    add_reference :select_cashes, :cash_sort, index: true, foreign_key: true
  end
end
