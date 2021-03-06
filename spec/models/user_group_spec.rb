describe UserGroup do
  it { should be_a(Twitterable) }
end

# == Schema Information
# Schema version: 20140701165803
#
# Table name: user_groups
#
#  id                :uuid             not null, primary key
#  registered_by_id  :uuid
#  homepage          :string(255)
#  name              :string(255)
#  slug              :string(255)
#  twitter           :string(255)
#  description       :text
#  topics            :text             is an Array
#  address           :text
#  formatted_address :text
#  city              :string(255)
#  state_province    :string(255)
#  country           :string(255)
#  latitude          :string(255)
#  longitude         :string(255)
#  logo              :string(255)
#  created_at        :datetime         indexed
#  updated_at        :datetime
#
# Indexes
#
#  index_user_groups_on_created_at  (created_at)
#
