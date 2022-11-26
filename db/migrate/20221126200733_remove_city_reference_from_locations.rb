class RemoveCityReferenceFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :locations, :city, null: false, foreign_key: true
  end
end
