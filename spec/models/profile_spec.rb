describe Profile do

  it { should belong_to(:user) }


end

# == Schema Information
# Schema version: 20140506045628
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer          indexed
#  full_name  :string(255)
#  nickname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
