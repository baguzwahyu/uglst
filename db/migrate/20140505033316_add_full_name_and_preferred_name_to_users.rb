class AddFullNameAndPreferredNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :preferred_name, :string
  end
end
