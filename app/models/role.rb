class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :users_roles
  belongs_to :resource, polymorphic: true

  scopify
end

# == Schema Information
# Schema version: 20140506045628
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string(255)      indexed, indexed => [resource_type, resource_id]
#  resource_id   :integer          indexed => [name, resource_type]
#  resource_type :string(255)      indexed => [name, resource_id]
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_roles_on_name                                    (name)
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#
