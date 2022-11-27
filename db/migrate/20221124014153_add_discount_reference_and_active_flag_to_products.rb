class AddDiscountReferenceAndActiveFlagToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :isactive, :boolean
    add_reference :products, :discount, null: true, foreign_key: true
  end
end
