require 'rails_helper'

RSpec.describe UserGroupMembership, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
# Schema version: 20140619034656
#
# Table name: user_group_memberships
#
#  id            :integer          not null, primary key
#  user_id       :uuid             indexed, indexed => [user_group_id]
#  user_group_id :uuid             indexed, indexed => [user_id]
#  relationship  :integer          default(1), indexed
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_user_group_memberships_on_relationship               (relationship)
#  index_user_group_memberships_on_user_group_id              (user_group_id)
#  index_user_group_memberships_on_user_id                    (user_id)
#  index_user_group_memberships_on_user_id_and_user_group_id  (user_id,user_group_id)
#