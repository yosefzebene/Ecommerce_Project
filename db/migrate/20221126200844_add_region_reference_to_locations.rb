class AddRegionReferenceToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :region, null: false, foreign_key: true
  end
end
