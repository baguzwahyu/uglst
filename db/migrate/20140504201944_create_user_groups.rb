class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.string :homepage

      t.timestamps
    end
  end
end
