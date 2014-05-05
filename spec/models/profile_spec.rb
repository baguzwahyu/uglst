require 'spec_helper'

describe Profile do

end

# == Schema Information
# Schema version: 20140505162210
#
# Table name: profiles
#
#  id             :integer          not null, primary key
#  user_id        :integer          indexed
#  preferred_name :string(255)
#  nickname       :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
