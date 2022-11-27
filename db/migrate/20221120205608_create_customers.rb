class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :password_digest
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
