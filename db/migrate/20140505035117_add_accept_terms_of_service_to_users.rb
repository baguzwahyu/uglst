class AddAcceptTermsOfServiceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :accept_terms_of_service, :boolean
  end
end
