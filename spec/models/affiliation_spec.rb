describe Affiliation do
  it { should belong_to :user }
  it { should belong_to :user_group }

  it { should allow_value(:organizer).for(:role) }
  it { should allow_value(:member).for(:role) }
  it { should_not allow_value(:supporter).for(:role) }
end

# == Schema Information
# Schema version: 20140506045628
#
# Table name: affiliations
#
#  id            :integer          not null, primary key
#  user_id       :integer          indexed
#  user_group_id :integer          indexed
#  role          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_affiliations_on_user_group_id  (user_group_id)
#  index_affiliations_on_user_id        (user_id)
#
