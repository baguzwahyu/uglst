class Location < ActiveRecord::Base
  has_many :venues, inverse_of: :location
  has_many :user_groups, through: :venues

  validates :name, presence: true
  validates :full_street_address, presence: true
end

# == Schema Information
# Schema version: 20140516063750
#
# Table name: locations
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  full_street_address :string(255)
#  address_parts       :hstore
#  latitude            :float            indexed => [longitude]
#  longitude           :float            indexed => [latitude]
#  created_at          :datetime
#  updated_at          :datetime
#
# Indexes
#
#  index_locations_on_latitude_and_longitude  (latitude,longitude)
#
