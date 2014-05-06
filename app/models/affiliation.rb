class Affiliation < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_group

  validates :role, inclusion: { in: %w{participant builder} }
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
