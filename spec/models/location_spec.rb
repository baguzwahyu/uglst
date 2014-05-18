require 'spec_helper'

describe Location do
  pending "add some examples to (or delete) #{__FILE__}"
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
