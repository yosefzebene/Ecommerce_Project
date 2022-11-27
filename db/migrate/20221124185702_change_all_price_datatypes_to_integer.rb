class ChangeAllPriceDatatypesToInteger < ActiveRecord::Migration[7.0]
  def self.up
    change_table :orders do |t|
      t.change :PST, :integer
      t.change :GST, :integer
      t.change :HST, :integer
      t.change :subtotal, :integer
    end

    change_table :order_products do |t|
      t.change :singleprice, :integer
    end

    change_table :products do |t|
      t.change :price, :integer
    end
  end

  def self.down
    change_table :orders do |t|
      t.change :PST, :decimal
      t.change :GST, :decimal
      t.change :HST, :decimal
      t.change :subtotal, :decimal
    end

    change_table :order_products do |t|
      t.change :singleprice, :decimal
    end

    change_table :products do |t|
      t.change :price, :decimal
    end
  end
end
