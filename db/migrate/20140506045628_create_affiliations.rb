class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :user, index: true
      t.references :user_group, index: true

      t.string :role

      t.timestamps
    end

    add_index :affiliations, [:user_id, :user_group_id], unique: true
  end
end
