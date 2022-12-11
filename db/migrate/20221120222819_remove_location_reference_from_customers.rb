class RemoveLocationReferenceFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :customers, :location, null: false, foreign_key: true
  end
end
