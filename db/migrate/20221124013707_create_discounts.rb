class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :percent
      t.datetime :valid_until
      t.text :note

      t.timestamps
    end
  end
end
