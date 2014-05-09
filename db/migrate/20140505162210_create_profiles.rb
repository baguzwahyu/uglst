class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :full_name
      t.string :nickname

      t.timestamps
    end
  end
end
