class Venue < ActiveRecord::Base
  belongs_to :location
  belongs_to :user_group

  accepts_nested_attributes_for :location
end

# == Schema Information
# Schema version: 20140516063750
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  user_group_id :integer          indexed
#  sponsor_id    :integer          indexed
#  location_id   :integer          indexed
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_venues_on_location_id    (location_id)
#  index_venues_on_sponsor_id     (sponsor_id)
#  index_venues_on_user_group_id  (user_group_id)
#
