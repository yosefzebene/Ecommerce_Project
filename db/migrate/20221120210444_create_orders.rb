class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status
      t.decimal :PST
      t.decimal :GST
      t.decimal :HST
      t.decimal :subtotal

      t.timestamps
    end
  end
end
