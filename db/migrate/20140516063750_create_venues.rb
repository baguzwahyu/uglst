class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :user_group, index: true
      t.references :sponsor, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
