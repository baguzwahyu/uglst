class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :full_street_address
      t.hstore :address_parts
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :locations, [:latitude, :longitude]
  end
end
