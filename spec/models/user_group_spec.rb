describe UserGroup do
  it { should validate_presence_of :name }
end

# == Schema Information
# Schema version: 20140505162210
#
# Table name: user_groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  homepage    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
